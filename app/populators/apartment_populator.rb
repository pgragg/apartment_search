class ApartmentPopulator

	def initialize(apt_search_data = AptSearch.new.scrape_apartment_data)
		@apartment_data = apt_search_data
	end

	def perform
		PageResponseIterator.iterate(@apartment_data)
		ApartmentUpdater.update_distances
	end

end

# ApartmentPopulator.new(AptSearch.new.get_apartment_data_from_raw_html(html)).perform