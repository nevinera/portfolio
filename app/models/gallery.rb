class Gallery < ActiveRecord::Base
  belongs_to :owner
  has_many :pictures
end
