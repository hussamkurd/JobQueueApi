# spec/factories/jobs.rb
FactoryBot.define do
  factory :job do
    title { "Sample Job" }
    status { "waiting" }
    priority { "high" }
  end
end
