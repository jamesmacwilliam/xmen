FactoryGirl.define do

  factory :team do
    name "Team 1"
    desc "Wolverine's team"
    user
  end

  factory :task do
    title "Do something"
    note "Missed a spot"
    completed false
    team
  end
end
