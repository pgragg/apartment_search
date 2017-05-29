class Apartment < ApplicationRecord

	def score
		if time_from_pipers.to_i == 0 || time_from_megans.to_i == 0 || price.to_i == 0
			return 0
		end
		100000000.0/((time_from_megans.to_f + time_from_pipers.to_f)*price.to_f)
	end

	def view_link
		"http://streeteasy.com/#{link_address}"
	end

	def saby
		address = link_address.split('/')[2]
		[address.split('-').join('+').gsub('_','-'),'New+York'].join('+').gsub("++", '+')
	end

	def searchable_address
			searchable_neighborhood = neighborhood.to_s.gsub(' ', '+').gsub(/'/, '%27')
			searchable_address = address.to_s.gsub(' ', '+').split('#').first.gsub(/'/, '%27')
			[searchable_address, searchable_neighborhood,'New+York'].join('+').gsub("++", '+')
	end

end
