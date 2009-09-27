require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

it_should_have_restful_routes Users

describe Users, "routes" do
  it "should route" do
    request_to("/register").should == {
      :controller => "users",
      :action => "new"
    }

    request_to('/users/change_ingame_id').should == {
      :controller => 'users',
      :action => 'change_ingame_id',
      :format => nil
    }
  end
end

describe Users, "NEW" do
  it "should render new user form" do
    hornsby_scenario
    response = get(url(:new_user, :format => 'html'))
    response.should be_successful
  end
end

describe Users, "CREATE" do
  it "should create user" do
    hornsby_scenario
    response = post(url(:users), :user => {
      :email => 'laurynasl@gmail.com', 
      :login => 'laurynasl', 
      :password => '123456', 
      :password_confirmation => '123456'
    })
    user = response.assigns(:user)
    user.should_not be_nil
    response.should redirect_to(resource(user))
  end

  it "should fail validation" do
    hornsby_scenario
    response = post(url(:users, :format => 'html'), :user => {
      :login => 'laurynasl', 
    })
    user = response.assigns(:user)
    response.should be_successful
  end
end

describe Users, "SHOW" do
  it "should show user's profile" do
    hornsby_scenario :laurynas
    response = get(resource(@laurynas, :format => 'html'))
    response.should be_successful
    response.assigns(:user).should == @laurynas
  end
end

describe Users, "change_ingame_id" do
  it "should change ingame id and redirect to show" do
    hornsby_scenario :laurynas
    response = laurynas_post(url(:change_ingame_id_users), :ingame_id => '<a href = "http://riteriai.draugas.lt/?recruit=6H2069" ><img src= "http://riteriai6.draugas.lt/signatures/lt/world_6/2069.jpg" alt="" /></a>')
    response.should redirect_to(resource(@laurynas))
    @laurynas.reload
    @laurynas.ingame_id.should == 2069
  end
end
