class Picture < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :user, :through => :gallery
end
