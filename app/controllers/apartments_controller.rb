class ApartmentsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]
  before_filter :set_headers

  def index
  	@apartments = Apartment.all.sort_by {|apt| -apt.score}
  end

  def recalculate
  	Apartment.destroy_all
  	ApartmentPopulator.new.perform 
  	redirect_to apartments_path
  end

  def ingest
    @apartments = Apartment.all
  end

  def create
    html = params[:html]
    data = AptSearch.new.get_apartment_data_from_raw_html(html)
    ApartmentPopulator.new(data).perform
    redirect_to ingest_path
  end

  def health_check
  	render json: {}
  end

  private

  def set_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

end
