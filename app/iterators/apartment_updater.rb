class ApartmentUpdater

	def self.update_prices
		Apartment.all.each do |apt|
			Streeteasy.update_apartment_price(apt)
		end
	end

	def self.update_neighborhoods
		Apartment.all.each do |apt|
			Streeteasy.update_apartment_neighborhood(apt)
		end
	end

	def self.update_distances
		Apartment.all.each do |apt|
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

# class DistanceMatrix
# 	KEY = 'AIzaSyAqlBXjNwKCcX_evq51V3k62Ldx7aPByAk'
# 	BASE_URL = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&transit_mode=train"

# 	def self.get_distance(apt_1, apt_2)
# 		origins = apt_1.address.gsub(' ', '+').gsub('#', '')
# 		destinations = apt_2.address.gsub(' ', '+').gsub('#', '')
# 		response = JSON.parse(RestClient.get("#{BASE_URL}&origins=#{origins}&destinations=#{destinations}&key=#{KEY}"))
# 		response['rows'][0]['elements'][0]['duration']['value'] rescue nil
# 	end
