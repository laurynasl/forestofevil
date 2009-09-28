# For details on Sequel migrations see 
# http://sequel.rubyforge.org/
# http://sequel.rubyforge.org/rdoc/classes/Sequel/Database.html#M000607

class ImportedPlayerMigration < Sequel::Migration

  def up
    create_table :imported_players do
      primary_key :id
      foreign_key :imported_clan_id, :imported_clans, :null => false, :index => true, :on_delete => :cascade
      varchar :name, :index => true, :null => false
      varchar :title, :index => true, :null => false
      integer :ingame_id, :null => false, :index => true
      integer :x_pos, :index => true, :null => false
      integer :y_pos, :index => true, :null => false
    end
  end

  def down
    drop_table :imported_players
  end

end
