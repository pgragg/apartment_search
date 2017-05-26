class PageResponseIterator

	attr_accessor :nil

	def self.iterate(cleaned_data)
		apt_count = Apartment.count
		cleaned_data.each do |cleaned_data|
			apt = Apartment.find_or_create_by(address: cleaned_data.address)
			apt.update_attributes(cleaned_data.to_h)
		end
		apts_found = Apartment.count - apt_count
		apts_found > 0 ? "OMG we found #{apts_found} Apartments! You ROCK!" : "No apts found. Glad you didn't have to check yourself?"
	end

end

# Apartment address:string:index price:integer:index beds:integer:index baths:integer:index square_footage:integer:index fee:boolean