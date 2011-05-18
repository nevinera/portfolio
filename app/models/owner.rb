class Owner < ActiveRecord::Base
  has_many :pictures, :through => :galleries
  has_many :galleries

  def albums
    @albums ||= self.get("account/albums.json")['albums'].select{|a| a['privacy'] == 'public'}
  end

  def rebuild_galleries_from_imgur!
    self.galleries.destroy_all
    self.albums.each do |album|
      Gallery.create_from_imgur(self, album['id'], self.albums)
    end
  end

  def limited_rebuild!(period)
    if self.last_rebuilt_at.blank? or (self.last_rebuilt_at + period < Time.now)
      self.rebuild_galleries_from_imgur!
    else
      raise "Cannot rebuild until #{self.last_rebuilt_at + period}!"
    end
  end
  

  def get_cookie
    data = {
      :username => self.username,
      :password => self.password
    }
    url = "api.imgur.com/2/signin.json"
    response = RestClient.post(url,data)
    @cookie = response.cookies["IMGURSESSION"]
  end

  def cookie
    @cookie ||= self.get_cookie
  end

  def headers
    {
      "Cookie" => "IMGURSESSION=#{self.cookie}"
    }
  end

  def get(path)
    unless path =~ /json$/
      path += '.json'
    end
    url = "http://api.imgur.com/2/" + path

    response = RestClient.get(url, self.headers)
    raise "Bad response from #{url}" if response.code != 200

    JSON.parse(response.body)
  end

end
