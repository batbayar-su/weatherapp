class WeathersController < ApplicationController
  def index

  end

  def show

  end


  def random
    # used to make http request
    require 'net/http'
    # sending request
    url = URI.parse('http://api.openweathermap.org/data/2.5/weather?q=Ulaanbaatar&appid=4a42e5e00cbebc51785ced84497c1f58')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }

    # show reponse
    @result = res.body
    render 'show'
  end
end
