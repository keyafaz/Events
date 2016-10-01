class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :content, length: { in: 2..100 }
end
