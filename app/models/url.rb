class Url < ActiveRecord::Base
  attr_accessible :address, :id, :shortened, :count
  validates :address, :format => { :with => /htt\w+\:\/\/\S+/, :message => "Please make sure http(s):// is appended to the front of your url" }
  validates_uniqueness_of :shortened
end


