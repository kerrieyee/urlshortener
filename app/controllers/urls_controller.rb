class UrlsController < ApplicationController

  def index
  	@urls = Url.all
  end

  def new
  end

  def create
  	shorten
  	if @url.valid?
  		@url.save
  	else
  		redirect_to urls_path
  		flash[:notice] = "Please make sure you have appended http(s):// in front of your url and that vanity url has not been previously entered"
  	end
  end

  def show
  	@url = Url.find(params[:id])  
    redirect_to @url.address
    @url.count += 1
    @url.save
  end

  private

  def shorten
  	@url = Url.new(params[:url])
  	if @url.shortened == ""
  		@url.shortened = random_shortened_url
  	else
  		@url.shortened
  	end
  end

  def random_shortened_url
  	(('a'..'z').to_a + ('A'..'Z').to_a + (1..9).to_a + ('a'..'z').to_a + ('A'..'Z').to_a + (1..9).to_a).shuffle[0..5].join
  end

	
end

