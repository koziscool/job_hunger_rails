class AddDefaultCompletedToRecommendations < ActiveRecord::Migration
  def change
    change_column_default :recommendations, :completed, :false
  end
end
