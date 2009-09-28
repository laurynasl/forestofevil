# For details on Sequel migrations see 
# http://sequel.rubyforge.org/
# http://sequel.rubyforge.org/rdoc/classes/Sequel/Database.html#M000607

class ImportedClanMigration < Sequel::Migration

  def up
    create_table :imported_clans do
      primary_key :id
      varchar :name, :index => true, :null => false
      integer :count, :index => true
    end
  end

  def down
    drop_table :imported_clans
  end

end
