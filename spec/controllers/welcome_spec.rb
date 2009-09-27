require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe Welcome, "routes" do
  it "should route" do
    request_to("/").should == {
      :controller => "welcome",
      :action => "index"
    }

    request_to('/resource_urls').should == {
      :controller => 'welcome',
      :action => 'resource_urls'
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

describe Welcome, "resource_urls" do
  it "should list resource urls" do
    hornsby_scenario :laurynas, :fiodor
    response = get(url(:resource_urls, :format => 'html'))
    response.should be_successful
    response.assigns(:ingame_ids).should == [1234]
  end
end
