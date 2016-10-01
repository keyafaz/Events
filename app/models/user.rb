class User < ApplicationRecord
  has_many :events_joined, through: :memberships, source: :event
  has_many :events
  has_many :comments, dependent: :destroy
  has_many :memberships, dependent: :destroy

  has_secure_password
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :city, :state, :presence => true, length: { in: 2..30 }
  validates :password, length: { minimum: 8 }, allow_nil: true
  validates :email, :uniqueness => { :case_sensitive => false }, :format => { :with => email_regex }
end
