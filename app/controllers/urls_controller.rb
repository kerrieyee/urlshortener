class UrlsController < ApplicationController
	before_filter :authenticate_user!
  def index
  	@urls = Url.where(:user_id => current_user.id)
  	puts "#{@urls.inspect}"
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

  # def delete
  #   @url = Url.find(params[:id])
  #   @url.delete
  # end

  private

  def shorten
  	@url = Url.new(params[:url])
  	@url.user_id = current_user.id
  	if @url.shortened == ""
  		@url.shortened = @url.random_shortened_url
  	else
  		@url.shortened
  	end
  end



	
end

