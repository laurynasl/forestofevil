# for more information, see http://github.com/laurynasl/hornsby/wikis/usage
scenario :laurynas do
  @laurynas = User.create(
    :email => 'laurynasl@gmail.com', 
    :login => 'kudlius', 
    :password => '123456', 
    :password_confirmation => '123456'
  )
end

scenario :fiodor do
  @fiodor = User.create(
    :email => 'fiodor.veresciaka@gmail.com',
    :login => 'fiodor',
    :password => '123456',
    :password_confirmation => '123456',
    :ingame_id => '1234'
  )
end

scenario :clan do
  @clan = ImportedClan.create(
    :name => 'Forest_of_Evil',
    :count => 76
  )
end
