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

describe User, "change_ingame_id" do
  it "should simply set it, because it is a number" do
    hornsby_scenario :laurynas
    @laurynas.change_ingame_id('2069')
    @laurynas.ingame_id.should == 2069
  end

  it "should recognize it from recruit url" do
    hornsby_scenario :laurynas
    @laurynas.change_ingame_id('http://riteriai.draugas.lt/?recruit=6H2069')
    @laurynas.ingame_id.should == 2069
  end
end
