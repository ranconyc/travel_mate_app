class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.date :date
      t.text :description
      t.string :category
      t.string :vibe
      t.integer :group_size
      t.string :location
      t.text :ideal_member
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
