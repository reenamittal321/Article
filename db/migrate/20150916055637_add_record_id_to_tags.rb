class AddRecordIdToTags < ActiveRecord::Migration
  def change
    add_column :tags, :record_id, :integer
  end
end
