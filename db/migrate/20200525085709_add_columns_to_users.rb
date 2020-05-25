class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :language, :string
    add_column :users, :location, :string
    add_column :users, :interest, :string
    add_column :users, :about, :text
  end
end
