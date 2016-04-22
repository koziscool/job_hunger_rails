require 'rails_helper'

RSpec.describe Job, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  let(:job) { build(:job) }

  it 'is valid with default attributes' do
    expect(job).to be_valid
  end

  it 'is not valid without title' do
    job.title = nil
    expect(job).to_not be_valid
  end

  it 'is not valid without company_id' do
    job.company_id = nil
    expect(job).to_not be_valid
  end

  it 'after_create callback creates Activity' do
    expect { job.save }.to change { Activity.count }.by 2
  end
end
