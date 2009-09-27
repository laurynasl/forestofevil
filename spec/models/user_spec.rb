require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe User do
  before(:each) do
    hornsby_scenario
    @laurynas = User.new(
      :email => 'laurynasl@gmail.com', 
      :login => 'laurynasl', 
      :password => '123456', 
      :password_confirmation => '123456'
    )
  end

  it "should be valid" do
    @laurynas.should be_valid
    @laurynas.save
  end

  it_should_have_timestamps :@laurynas

end
