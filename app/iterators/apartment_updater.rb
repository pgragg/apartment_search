class ApartmentUpdater

	def self.clean_data(search_options)
		output = []
		search_options.each do |option|
			begin
				new_option = OpenStruct.new
				new_option.address = option[:address]
				new_option.price = option[:price].gsub('$', '').gsub(',', '').to_i
				new_option.beds = option[:raw_bed_bath_sqft].split('bed')[0].to_i
				new_option.baths = option[:raw_bed_bath_sqft].split('bath')[0].split('bed')[1].to_i
				new_option.square_footage = option[:raw_bed_bath_sqft].split('bath')[1].split('ft')[0].to_i rescue nil 
				new_option.neighborhood = option[:raw_location].split('in')[1].strip
				new_option.link_address = option[:link_address]
				output << new_option
			rescue 
				byebug
			end
		end
		output
	end

	def self.update_distances
		Apartment.all.each do |apt|
			next if apt.time_from_megans && apt.time_from_pipers
			time_from_megans = DistanceMatrix.get_distance(apt, Workplace.megans_work)# rescue nil 
			time_from_pipers = DistanceMatrix.get_distance(apt, Workplace.pipers_work) #rescue nil
			if time_from_megans
				apt.update_attributes(time_from_megans: time_from_megans)
			end
			if time_from_pipers
				apt.update_attributes(time_from_pipers: time_from_pipers)
			end
		end
	end

end

