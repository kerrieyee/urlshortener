class UrlsController < ApplicationController

  def index
  	@urls = Url.all
  end

  def new
  end

  def create
  	@url = Url.new(params[:url])
  	if @url.valid?
  		@url.save
  	else
  		raise "Try entering your address again with http(s)://appended to the front of the url."
  		redirect_to @urls
  	end
  end

  def show
  	url = Url.find(params[:id])  
    redirect_to url.address
  end
end
