require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

it_should_have_restful_routes Users

describe Users, "routes" do
  it "should route" do
#    request_to("/users").should == {
#      :controller => "users",
#      :action => "index",
#      :format => nil
#    }
  end
end
