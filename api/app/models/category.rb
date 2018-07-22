class Category < ActiveRecord::Base
	validates :name, 
		presence: true, 
		length: { in: 1.. 20 }
	has_many :products, :dependent => :delete_all
end
