class AddTagToTags < ActiveRecord::Migration
  def change
    add_column :tags, :tag, :string
  end
end
