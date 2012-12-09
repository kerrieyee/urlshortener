class UrlsController < ApplicationController
	before_filter :authenticate_user!
  def index
  	@urls = Url.where(:user_id => current_user.id)
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
    @url = Url.find_by_shortened(params[:shortened])
    redirect_to @url.address
    @url.count += 1
    @url.save
  end

  def destroy
    @url = Url.find(params[:id])
    @url.destroy
    redirect_to urls_path
  end

  private

  def shorten
  	@url = Url.new( :address => params[:url][:address],
                    :shortened => params[:url][:shortened],
                    :user_id => current_user.id)
  	if @url.shortened == ""
  		@url.shortened = @url.random_shortened_url
  	else
  		@url.shortened
  	end
  end



	
end

