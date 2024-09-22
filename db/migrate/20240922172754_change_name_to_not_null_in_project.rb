class ChangeNameToNotNullInProject < ActiveRecord::Migration[7.2]
  def change
    change_column_null :projects, :name, false
  end
end
