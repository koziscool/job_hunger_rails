class AddActivities < ActiveRecord::Migration
  def up
    create_table :activities do |t|
      t.integer :user_id
      t.string :token_id
      t.integer :points
      t.string :description

      t.timestamps null: false
    end
  end

  def down
    drop_table :activities
  end
end
