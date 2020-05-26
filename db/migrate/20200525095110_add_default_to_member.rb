class AddDefaultToMember < ActiveRecord::Migration[6.0]
  def change
    change_column :members, :status, :string, :default => 'pending'
  end
end
