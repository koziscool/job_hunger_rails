puts 'Deleting everything...'

Job.destroy_all
Lead.destroy_all
Company.destroy_all
Recommendation.destroy_all
User.destroy_all

MULTIPLIER = 2

puts 'Creating users...'

def create_user
  email = Faker::Internet.email
  User.create(email: email, password: 'password')
end

MULTIPLIER.times do
  create_user
end

User.create(email: 'test@test.com', password: 'password')

puts 'Creating companies...'

def create_company(user_id)
  Company.create(name: Faker::Company.name, user_id: user_id, notes: Faker::Company.catch_phrase, interest: rand(1..5), website: Faker::Internet.url, blog: Faker::Internet.url, address: "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state_abbr}, #{Faker::Address.zip}")
end

User.all.each do |user|
  2.times do
    create_company(user.id)
  end
end

def create_lead(company_id)
  Lead.create(company_id: company_id, email: Faker::Internet.url, name: Faker::Name.name, blog: Faker::Internet.url, linked_in: Faker::Internet.url, notes: Faker::Company.catch_phrase)
end

def create_job(company_id)
  Job.create(title: Faker::Name.title, application_status: %w(Interested Applied Rejected Interview Offer).sample, url: Faker::Internet.url, company_id: company_id)
end

def create_company_recommendations(company)
  recommendations = [
    "Do some google-ing to find #{company.name}'s tech blog",
    "Gather some cool facts about #{company.name}"
  ]
  action = recommendations.sample
  Recommendation.create(recommendable_type: company.class, recommendable_id: company.id, completed: false, action: action, user_id: company.user.id, start_date: DateTime.now + rand(1..3))
end

puts 'Creating leads and jobs...'

Company.all.each do |company|
  2.times do
    create_lead(company.id)
  end
  create_job(company.id)
  create_company_recommendations(company)
end

puts 'Creating recommendations...'

def create_lead_recommendations(lead)
  recommendations = ["Step up your stalker game and find #{lead.name}'s blog", "Connect with #{lead.name} on LinkedIn", "Is #{lead.name}'s company hosting a Meetup soon?"]
  action = recommendations.sample

  Recommendation.create(recommendable_type: lead.class, recommendable_id: lead.id, completed: false, action: action, user_id: lead.company.user.id, start_date: DateTime.now + rand(1..3))
end

Lead.all.each do |lead|
  create_lead_recommendations(lead)
end

puts 'Done!'
