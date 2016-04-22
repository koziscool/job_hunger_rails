class Recommendation < ActiveRecord::Base
  belongs_to :user
  belongs_to :recommendable, polymorphic: true

  validates :user, presence: true
  validates :recommendable, presence: true
  validates :action, presence: true
end
