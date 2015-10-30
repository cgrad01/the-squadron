class Question < ActiveRecord::Base
  belongs_to  :survey
  has_one     :user, through: :survey, source: :creator_id
  has_many    :choices

end
