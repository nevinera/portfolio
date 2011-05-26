class Setting < ActiveRecord::Base
  validates_uniqueness_of :name

  def self.get(name)
    Setting.where(:name => name.to_s).first.try(:value)
  end

  def self.exist?(name)
    Setting.where(:name => name.to_s).count > 0
  end

  def self.set(name, value)
    s = self.find_or_create_by_name(:name => name.to_s)
    s.value = value
    s.save!
  end
end
