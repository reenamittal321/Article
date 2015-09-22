class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :name
      t.text :description
     
      t.timestamps null: false
    end
  end
end
