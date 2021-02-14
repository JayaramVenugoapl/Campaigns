class DiscussionTopic < ApplicationRecord
  belongs_to :campaign
  belongs_to :user

  validates_uniqueness_of :campaign,  uniqueness: { scope: :user },on: :create, message: "User can create only one topic for a campaign"
end
