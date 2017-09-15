class WeathersController < ApplicationController
  def index
    # initialize sunny weather
    @weather_type = 'sunny'
    # used to make http request
    require 'net/http'
    # get random city if there is no user input
    if params[:city_name].present?
      query = params[:city_name]
    else
      # query = City.order("RANDOM()").limit(1).name
      offset = rand(City.count)
      query = City.offset(offset).first.name
    end
    query = URI::escape(query)

    # sending request
    url = URI.parse("http://api.openweathermap.org/data/2.5/weather?q=#{query}&appid=#{Rails.application.secrets.open_weather_key}&units=metric")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }

    # parse json
    @result = JSON.parse(res.body)

    # throw record not found when data not found to show 404 page
    raise ActiveRecord::RecordNotFound if @result['cod'] == '404'

    # # converting weather type
    # case @result['cod']
    #   when condition
    #     @weather_type
    #   when condition

    # end

  end
end
