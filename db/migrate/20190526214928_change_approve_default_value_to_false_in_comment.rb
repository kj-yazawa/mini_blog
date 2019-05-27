class ChangeApproveDefaultValueToFalseInComment < ActiveRecord::Migration[5.2]
  def up
    change_column :comments, :approved, :boolean, default: false
  end

  def down
    change_column :comments, :approved, :boolean, default: nil
  end
end
