class Role < ActiveRecord::Base
attr_accesible :name
has_many :users
end
