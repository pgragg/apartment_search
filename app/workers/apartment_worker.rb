class ApartmentWorker

	def initialize

	end

	def perform
		PageIterator.iterate
		ApartmentUpdater.update_prices
		ApartmentUpdater.update_neighborhoods
		ApartmentUpdater.update_distances
	end

end