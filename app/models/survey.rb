class Survey < ActiveRecord::Base
  belongs_to :user, foreign_key: :creator_id
  has_many   :questions
  has_many   :responses

  validates :creator_id, presence: true
  validates :title, presence: true

end
