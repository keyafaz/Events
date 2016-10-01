class Event < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :memberships, dependent: :destroy
  has_many :users_joined, through: :memberships, source: :user

  validates :name, :date, :state, :presence => true
end
