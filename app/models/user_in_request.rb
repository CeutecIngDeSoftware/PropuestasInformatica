class UserInRequest < ActiveRecord::Base
  attr_accessible :user_id, :request_id
  belongs_to :user
  belongs_to :request
end
