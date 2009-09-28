require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

it_should_have_restful_routes ImportedClans

describe ImportedClans, "routes" do
  it "should route" do
#    request_to("/imported_clans").should == {
#      :controller => "imported_clans",
#      :action => "index",
#      :format => nil
#    }
  end
end

describe ImportedClans, "NEW" do
  it "should render form" do
    hornsby_scenario :laurynas
    response = laurynas_get(url(:new_imported_clan, :format => 'html'))
    response.should be_successful
  end
end

describe ImportedClans, "CREATE" do
  it "should create new imported clan" do
    hornsby_scenario :laurynas
    ImportedClan.should_receive(:import).with('data')
    response = laurynas_post(url(:imported_clans)) do |c|
      c.params[:data] = {'tempfile' => 'data'}
    end
    response.should redirect_to(url(:imported_clans))
  end
end

describe ImportedClans, "SHOW" do
  it "should show clan" do
    hornsby_scenario :clan, :laurynas
    response = laurynas_get(resource(@clan, :format => 'html'))
    response.should be_successful
    response.assigns(:imported_clan).should == @clan
  end
end
