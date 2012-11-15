class Url < ActiveRecord::Base
	belongs_to :user
  attr_accessible :address, :id, :shortened, :count, :user_id
  validates :address, :format => { :with => /htt\w+\:\/\/\S+/, :message => "Please make sure http(s):// is appended to the front of your url" }
  validates_uniqueness_of :shortened
end


