# for more information, see http://github.com/laurynasl/hornsby/wikis/usage
scenario :laurynas do
  @laurynas = User.create(
    :email => 'laurynasl@gmail.com', 
    :login => 'kudlius', 
    :password => '123456', 
    :password_confirmation => '123456'
  )
end
