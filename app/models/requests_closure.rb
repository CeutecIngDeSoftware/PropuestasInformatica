class RequestsClosure < ActiveRecord::Base
  attr_accessible :career_id, :final_date
  belongs_to :career
end
