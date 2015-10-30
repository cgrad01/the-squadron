class User < ActiveRecord::Base
  has_many :surveys, foreign_key: :creator_id
  has_many :responses

  validates :name, presence: true, uniqueness: true

  has_secure_password
end
