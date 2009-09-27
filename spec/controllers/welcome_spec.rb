require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe Welcome, "routes" do
  it "should route" do
    request_to("/").should == {
      :controller => "welcome",
      :action => "index"
    }
  end
end

describe Welcome, "INDEX" do
  it "should render homepage" do
    hornsby_scenario
    response = get(url(:welcome, :format => 'html'))
    response.should be_successful
  end
end
