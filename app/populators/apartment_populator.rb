class ApartmentPopulator

	def initialize(apt_search = AptSearch.new)
		apartment_data = apt_search.scrape_apartment_data
		@clean_data = ApartmentUpdater.clean_data(apartment_data)
	end

	def perform
		PageResponseIterator.iterate(@clean_data)
		ApartmentUpdater.update_distances
	end

end