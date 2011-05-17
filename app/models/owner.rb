class Owner < ActiveRecord::Base
  has_many :galleries
  has_many :pictures, :through => :galleries

  def album_list
    self.get("account/albums.json")
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
