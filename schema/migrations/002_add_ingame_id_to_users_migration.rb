# For details on Sequel migrations see 
# http://sequel.rubyforge.org/
# http://sequel.rubyforge.org/rdoc/classes/Sequel/Database.html#M000607

class AddIngameIdToUsersMigration < Sequel::Migration

  def up
    alter_table :users do
      add_column :ingame_id, :integer
      add_index :ingame_id
    end
  end

  def down
    alter_table :users do
      drop_column :ingame_id
    end
  end

end
