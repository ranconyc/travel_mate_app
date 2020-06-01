class AddHometownToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :hometown, :string
  end
end
