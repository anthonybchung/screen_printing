class ChangeCustomerNameToNotNullInProject < ActiveRecord::Migration[7.2]
  def change
    change_column_null :projects, :customer_name, false
  end
end
