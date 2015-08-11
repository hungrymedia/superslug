# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  permalink  :string(255)
#  site_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :page do
    name { Faker::Lorem.words(4).join(' ') }
    site
  end
end
