class Picture < ActiveRecord::Base
  belongs_to :gallery

  def self.create_from_json(gal, j)
    Picture.create({
      :hash             => j['image']['hash'],
      :caption          => j['image']['caption'],
      :name             => j['image']['title'],
      :width            => j['image']['width'],
      :height           => j['image']['height'],
      :url              => j['links']['original'],
      :thumbnail_url    => j['links']['large_thumbnail'],
      :gallery_id       => gal.id
    })
  end

end
