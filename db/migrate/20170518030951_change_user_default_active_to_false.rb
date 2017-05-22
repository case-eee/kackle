class ChangeUserDefaultActiveToFalse < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :active, false
  end
end
