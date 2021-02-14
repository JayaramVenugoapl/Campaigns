class Campaign < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :discussion_topic

  enum estimated_duration: [:one_week, :one_month, :three_months]
  acts_as_taggable_on :tags

end
