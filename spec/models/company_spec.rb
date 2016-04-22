require 'rails_helper'

RSpec.describe Company, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  let(:company) { build(:company) }

  it 'is valid with default attributes' do
    expect(company).to be_valid
  end

  it 'is not valid without name' do
    company.name = nil
    expect(company).to_not be_valid
  end

  it 'is not valid without company_id' do
    company.user_id = nil
    expect(company).to_not be_valid
  end

  it 'after_create callback creates Activity' do
    expect { company.save }.to change { Activity.count }.by 1
  end
end
