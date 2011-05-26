module Imgur
  def self.get(path)
    raise "imgur api targets should all be json" if path !~ /json/

    url = "http://api.imgur.com/2/" + path
    response = RestClient.get(url, self.headers)
    raise "Bad response from #{url}" if response.code != 200

    JSON.parse(response.body)
  end

  def self.cookie
    if @cookie
      @cookie
    else
      data = {
        :username => Setting.get(:username),
        :password => Setting.get(:password)
      }
      url = "api.imgur.com/2/signin.json"
      response = RestClient.post(url, data)
      @cookie = response.cookies["IMGURSESSION"]
    end
  end

  def self.headers
    {
      "Cookie" => "IMGURSESSION=#{self.cookie}"
    }
  end
end
