class Owner < ActiveRecord::Base
  has_many :galleries
  has_many :pictures, :through => :galleries
end
