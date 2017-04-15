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

	def searchable_address
		calculate_searchable_by
	end

	private

	def calculate_searchable_by
		address = link_address.split('/')[2]
		[address.split('-').join('+').gsub('_','-'),'New+York'].join('+').gsub("++", '+')
	end

end
