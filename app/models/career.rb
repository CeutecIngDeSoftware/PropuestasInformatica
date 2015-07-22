class Career < ActiveRecord::Base
attr_accesible :name
has_many :users
has_many :courses
end
