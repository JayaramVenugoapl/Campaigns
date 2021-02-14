class DiscussionTopicSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_one :campaign
  has_one :user
end
