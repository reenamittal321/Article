class RemoveTagNameFromTags < ActiveRecord::Migration
  def change
    remove_column :tags, :tag_name, :string
  end
end
