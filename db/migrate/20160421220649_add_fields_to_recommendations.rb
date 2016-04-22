class AddFieldsToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :query, :string
    add_column :recommendations, :field, :string
  end
end
