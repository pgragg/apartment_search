class ApartmentsController < ApplicationController
  def index
  	@apartments = Apartment.all.sort_by {|apt| -apt.score}
  end
end
