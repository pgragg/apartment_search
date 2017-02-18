class ApartmentsController < ApplicationController
  def index
  	@apartments = Apartment.all.sort_by {|apt| -apt.score}
  end

  def recalculate
  	Apartment.destroy_all
  	ApartmentPopulator.new.perform 
  	redirect_to apartments_path
  end
end
