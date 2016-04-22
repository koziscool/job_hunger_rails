require 'rails_helper'

RSpec.describe Activity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  let(:activity) { build(:activity) }

  it 'is valid with default attributes' do
    expect(activity).to be_valid
  end

  it 'is not valid without user_id' do
    activity.user_id = nil
    expect(activity).to_not be_valid
  end

  it 'is not valid without points' do
    activity.points = nil
    expect(activity).to_not be_valid
  end
end
