class Lead < ActiveRecord::Base
  include Recommendable

  belongs_to :company

  has_many :recommendations, as: :recommendable, dependent: :destroy
  has_many :scores, as: :scoreable
  has_one :user, through: :company

  validates :name, presence: true
  validates :company_id, presence: true

  after_create :make_activity

  def recommendable_actions
    [
      {
        field: 'blog',
        query: "#{name} blog",
        action: 'Add the personal blog'
      },
      {
        field: 'linked_in',
        query: "#{name} linked in",
        action: 'Add the Linked In account'
      }
    ]
  end

  private

  def make_activity
    user_id = company.user.id
    points = 321
    description = "User added lead #{name} to profile"
    activity = Activity.new(user_id: user_id,
                            points: points,
                            description: description)
    activity.save
  end
end
