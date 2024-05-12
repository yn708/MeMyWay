class CreateStressPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :stress_posts do |t|
      t.string :title, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
