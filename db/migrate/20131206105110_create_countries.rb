class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :country_code  , :limit => 2,   :default => "", :null => false 
      t.string :country_name, :limit => 100, :default => "", :null => false

      t.timestamps
    end
  end
end
