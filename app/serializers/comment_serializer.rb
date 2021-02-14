class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text
  has_one :campaign
  has_one :user
end
