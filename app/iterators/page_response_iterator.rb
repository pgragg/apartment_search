class PageResponseIterator

	attr_accessor :nil

	def self.iterate(page_response)
		return if page_response == "error"
		apt_count = Apartment.count
		page_response.each do |address, information|
			apt = Apartment.find_or_create_by(address: address)
			apt.update_attributes(link_address: information[:href])
		end
		apts_found = Apartment.count - apt_count
		apts_found > 0 ? "OMG we found #{apts_found} Apartments! You ROCK!" : "No apts found. Glad you didn't have to check yourself?"
	end

end

# Apartment address:string:index price:integer:index beds:integer:index baths:integer:index square_footage:integer:index fee:boolean