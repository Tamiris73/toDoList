class AddNotNullConstraintToUserIdInLists < ActiveRecord::Migration[6.0]
  def change
    change_column_null :lists, :user_id, false
  end
end
