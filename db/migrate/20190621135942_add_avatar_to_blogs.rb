class AddAvatarToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :avatar, :string
  end
end
