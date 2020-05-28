class AddDefaultValueToActivityPrice < ActiveRecord::Migration[6.0]
  def change
    change_column :activities, :price, :integer, :default => 'Free'
  end
end
