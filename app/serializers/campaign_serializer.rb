class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :title, :purpose, :estimated_duration
  has_one :user
  has_many :tags
  has_one :discussion_topic
  has_many :comments
end
