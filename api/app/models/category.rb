class Category < ActiveRecord::Base
	validates :name, 
		presence: true, 
		length: { in: 1.. 20 }
	has_many :product
end
