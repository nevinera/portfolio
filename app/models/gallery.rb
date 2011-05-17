class Gallery < ActiveRecord::Base
  belongs_to :owner
  has_many :pictures, :dependent => :destroy


  def self.create_from_imgur(own, gallery_hash, albums=nil)
    albums ||= own.get("account/albums.json")['albums']
    unless album = albums.detect{|a| a['id'] == gallery_hash}
      raise "Album '#{gallery_hash}' not found"
    end

    g = Gallery.create({
      :title        => album['title'],
      :shortname    => album['link'].split('/').last,
      :description  => album['description'],
      :imgur_id     => album['id'],
      :owner_id     => own.id
    })

    images = own.get("account/albums/#{gallery_hash}.json")['albums']
    images.each do |img|
        Picture.create_from_json(g, img)
    end
  end
end
