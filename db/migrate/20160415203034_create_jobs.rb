class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title, null: false
      t.boolean :application_status
      t.string :url
      t.integer :company_id, null: false

      t.timestamps null: false
    end
  end
end
