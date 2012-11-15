class Url < ActiveRecord::Base
	belongs_to :user
	before_create :random_shortened_url
  attr_accessible :address, :id, :shortened, :count, :user_id
  validates :address, :format => { :with => /htt\w+\:\/\/\S+/, :message => "Please make sure http(s):// is appended to the front of your url" }
  validates_uniqueness_of :shortened


  def random_shortened_url
  	(('a'..'z').to_a + ('A'..'Z').to_a + (1..9).to_a + ('a'..'z').to_a + ('A'..'Z').to_a + (1..9).to_a).shuffle[0..5].join
  end
end


