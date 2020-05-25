class AddDefaultToMember < ActiveRecord::Migration[6.0]
  def change
    attribute :status, :string, default: "pending"
  end
end
