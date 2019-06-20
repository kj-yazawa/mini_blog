class AddCategoryColumnToBlogs < ActiveRecord::Migration[5.2]
  def up
    add_column :blogs, :category, :integer, default: 0
  end
  def down
    drop_column :blogs, :category
  end
end
