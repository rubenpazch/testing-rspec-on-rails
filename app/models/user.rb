class User < ApplicationRecord
  has_many :posts

  validates :username, presence: { message: 'Username must be given' },
                       length: { in: 6..20, message: 'Username length must be between 6 to 20 characters' },
                       uniqueness: { message: 'Username already exists' },
                       format: { with: /\A[a-zA-Z0-9]+\z/, message: 'Username must be alphanumeric' }
end
