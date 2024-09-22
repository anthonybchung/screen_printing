class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :note
      t.date :due_date
      t.string :customer_name

      t.timestamps
    end
    add_index :projects, :name, unique: true
  end
end
