class Setting < ActiveRecord::Base
  validates_uniqueness_of :name

  def self.get(name)
    Setting.where(:name => name).first || nil
  end

  def self.exist?(name)
    Setting.where(:name => name).count > 0
  end

  def self.set(name, value)
    s = self.find_or_create_by_name(:name => name)
    s.value = value
    s.save!
  end
end
