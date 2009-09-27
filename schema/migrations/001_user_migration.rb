# For details on Sequel migrations see 
# http://sequel.rubyforge.org/
# http://sequel.rubyforge.org/rdoc/classes/Sequel/Database.html#M000607

class UserMigration < Sequel::Migration

  def up
    create_table :users do
      primary_key :id
      varchar :login, :null => false
      varchar :email, :null => false
      timestamp :created_at
      timestamp :updated_at
      timestamp :activated_at
      varchar :activation_code
      varchar :crypted_password
      varchar :salt
      timestamp :remember_token_expires_at
      varchar :remember_token
      varchar :password_reset_key
    end
  end

  def down
    drop_table :users
  end

end
