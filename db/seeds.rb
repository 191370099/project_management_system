require 'faker'

5.times do
  Developer.create(
    name: Faker::Name.unique.name,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.unique.email
  )
end

5.times do
  Manager.create(
    name: Faker::Name.unique.name,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.unique.email
  )
end


4.times do
  Project.create(
    name: Faker::Lorem.words(number: 2).join(' '),
    description: Faker::Lorem.paragraph,
    due_date: Faker::Date.forward(days: 30),
    manager: Manager.all.sample
  )
end

20.times do
  Task.create(
    name: Faker::Lorem.words(number: 2).join(' '),
    description: Faker::Lorem.paragraph,
    task_type: %w[bug feature].sample,
    task_status: %w[pending assigned completed].sample,
    priority: rand(1..10),
    project: Project.all.sample,
    developer: Developer.all.sample
  )
end