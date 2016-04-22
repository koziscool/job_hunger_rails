module Recommendable
  extend ActiveSupport::Concern

  included do
    has_many :recommendations, as: :recommendable, dependent: :destroy

    after_create :generate_recommendations
    after_update :complete_recommendations
  end

  def generate_recommendations
    recommendable_actions.each do |action|
      recommendations.create!(
        action: action[:action],
        user: user,
        query: action[:query],
        field: action[:field],
        start_date: Date.today
      )
    end
  end

  def added_fields
    changes.each_with_object([]) do |change, new_fields|
      property, (old, _) = change
      new_fields << property unless old
    end
  end

  def complete_recommendations
    added_fields.each do |field|
      recommendations.where(field: field).each do |recommendation|
        recommendation.update(completed: true)
      end
    end
  end
end
