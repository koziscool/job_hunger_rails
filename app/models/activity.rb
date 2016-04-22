class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :scoreable, polymorphic: true

  validates :user_id, presence: true
  validates :points, presence: true
end
