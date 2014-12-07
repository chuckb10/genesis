# -*- coding: utf-8 -*-
class FeedController < ApplicationController
  def show
    @lng = params["lng"]
    @lat = params["lat"]
    @r   = params["r"]
    @client = Twitter::REST::Client.new(
      :consumer_key        => "yiKCOzNfwjoomEvP9VjWvqMhw",
      :consumer_secret     => "QHtTshmIkbc00OBAdB1kkVkzQTtjl32EK9X8b0OuJ8mVD3tD5O",
      :access_token        => "147102980-weBhVQkay0WeiT1ZSgVNtGfHkyf8IFchacm0EOBd",
      :access_token_secret => "eV5jtU4c64pk9XuA23Dw6p7sqfndtGyAHSnZWLPoVrsCL",
    )
    @texts = Array.new
    @r_km = @r.to_i/1000
    geoloc = @lat.to_s + "," + @lng.to_s + "," + @r_km.to_s + "km"
    tweets = @client.search("",{:geocode => geoloc ,:result_type => "mixed", :lang => "ja" , :count => 15})
    tweets.take(10).map do |tweet|
      @texts.push(tweet.text)
    end
    
  end 
  
  def callback
    
  end
end
