require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

it_should_have_restful_routes Users

describe Users, "routes" do
  it "should route" do
    request_to("/register").should == {
      :controller => "users",
      :action => "new"
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
end

describe Users, "SHOW" do
  it "should show user's profile" do
    hornsby_scenario :laurynas
    response = get(resource(@laurynas, :format => 'html'))
    response.should be_successful
    response.assigns(:user).should == @laurynas
  end
end
