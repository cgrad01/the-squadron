class Response < ActiveRecord::Base
  belongs_to  :user, foreign_key: :taker_id
  belongs_to  :choice
  belongs_to  :survey

end
