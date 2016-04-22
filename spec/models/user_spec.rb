require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  let(:user) { build(:user) }

  it 'is valid with default attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without encrypted_password' do
    user.encrypted_password = nil
    expect { user.save }.to raise_error
  end
end
