FactoryGirl.define do
  factory :recommendation do
    start_date DateTime.now
    action 'write an email'
    completed false
  end
end
