class AddRecordIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :record_id, :integer
  end
end
