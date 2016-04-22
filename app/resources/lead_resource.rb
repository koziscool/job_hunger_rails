class LeadResource < JSONAPI::Resource
  has_one :company
  has_many :recommendations

  attributes :name, :linked_in, :blog, :email, :notes

  # after_create :generate_recommendation
  #
  # def generate_recommendation
  #   recommendations = ["Step up your stalker game and find #{@model.name}'s blog", "Connect with #{@model.name} on LinkedIn", "Is #{@model.name}'s company hosting a Meetup soon?"]
  #   action = recommendations.sample
  #
  #   Recommendation.create(recommendable_type: @model.class, recommendable_id: @model.id, completed: false, action: action, user_id: @model.company.user.id, start_date: DateTime.now + rand(1..3))
  # end
end
