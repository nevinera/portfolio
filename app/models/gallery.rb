class Gallery < ActiveRecord::Base
  has_many :pictures, :dependent => :destroy

  validates_uniqueness_of :shortname

  default_scope :order => 'ordering ASC'

  def self.create_from_imgur(gallery_hash, albums=nil)
    albums ||= Imgur.get("account/albums.json")['albums']
    unless album = albums.detect{|a| a['id'] == gallery_hash}
      raise "Album '#{gallery_hash}' not found"
    end

    g = Gallery.create({
      :title        => album['title'],
      :shortname    => album['link'].split('/').last,
      :description  => album['description'],
      :imgur_id     => album['id'],
      :ordering     => album['order']
    })

    images = Imgur.get("account/albums/#{gallery_hash}.json")['albums']
    images.each do |img|
        Picture.create_from_json(g, img)
    end
  end

  def self.rebuild_galleries_from_imgur!
    Gallery.destroy_all
    self.albums.each do |album|
      Gallery.create_from_imgur(album['id'], self.albums)
    end
    Setting.set(:last_rebuilt, Time.now.to_s)
  end

  def self.limited_rebuild!(period)
    last_rebuilt = Setting.get(:last_rebuilt)
    last_rebuilt = Time.parse(last_rebuilt) if last_rebuilt
    if last_rebuilt.blank? or (last_rebuilt + period < Time.now)
      self.rebuild_galleries_from_imgur!
    else
      raise "Cannot rebuild until #{last_rebuilt + period}!"
    end
  end

  def self.albums
    @albums ||= Imgur.get("account/albums.json")['albums'].select do |alb|
      alb and alb['privacy'] and alb['privacy'] == 'public'
    end
  end

end
