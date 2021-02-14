class User < ApplicationRecord
  has_secure_password
  has_many :campaigns
  has_many :comments
  has_one :discussion_topic

  validates :email, :presence => true, :length => { :maximum => 255 },
                    :format => { :with => VALID_EMAIL_REGEX },
                    :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true, :length => { :minimum => 6 }, on: :create
  validates :username, :presence => true, :uniqueness => { :case_sensitive => false }, on: :create
end