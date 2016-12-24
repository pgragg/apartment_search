class Apartment < ApplicationRecord

	def score
		if time_from_pipers.to_i == 0 || time_from_megans.to_i == 0 || price.to_i == 0
			return 0
		end
		100000000.0/((time_from_megans.to_f + time_from_pipers.to_f)*price.to_f)
	end

	def view_link
		"#{Streeteasy::BASE_URL}#{link_address}"
	end

	def saby
		# 172_90-highland-avenue-queens
		address = link_address.split('/')[2]
		[address.split('-').join('+').gsub('_','-'),'New+York'].join('+').gsub("++", '+')
	end

	def searchable_address
		saby
			# searchable_neighborhood = neighborhood.to_s.gsub(' ', '+')
			# searchable_address = address.to_s.gsub(' ', '+').split('#').first
			# [searchable_neighborhood,'New+York'].join('+').gsub("++", '+')
	end

end
