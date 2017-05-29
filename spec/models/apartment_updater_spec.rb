require 'rails_helper'

RSpec.describe ApartmentUpdater do
	context 'Providing results' do 
		it 'correctly interprets a search options' do
			data = ApartmentUpdater.clean_data(single_search_option)
			cleaned_data = data[0]
			expect(cleaned_data.address).to eq("335 Throop Avenue #1I")
			expect(cleaned_data.price).to eq(2250)
			expect(cleaned_data.beds).to eq(1)
			expect(cleaned_data.baths).to eq(1)
			expect(cleaned_data.square_footage).to eq(700)
			expect(cleaned_data.neighborhood).to eq("Bath Beach")
		end 
		it 'interprets multiple search options' do
			data = ApartmentUpdater.clean_data(stubbed_search_options)
			expect(data.count).to eq(stubbed_search_options.count)
		end
		# it 'can clean data inputted from a parsed html page' do 
			
		# end
		it 'feeds into the PageResponseIterator' do
			data = ApartmentUpdater.clean_data(stubbed_search_options)
			PageResponseIterator.iterate(data)
			expect(Apartment.count).to eq(stubbed_search_options.count)
		end
	end
end

def single_search_option
	[{:address=>"335 Throop Avenue #1I", :price=>"$2,250", :raw_bed_bath_sqft=>"1 bed1 bath700 ft²", :raw_location=>"\n      Rental Unit in Bath Beach    "}]
end

def stubbed_search_options
	[{:address=>"245 East 124th Street #7M", :price=>"$2,353", :raw_bed_bath_sqft=>"1 bed1 bath", :raw_location=>"\n      Rental Unit in East Harlem    "}, {:address=>"335 Throop Avenue #1I", :price=>"$2,250", :raw_bed_bath_sqft=>"1 bed1 bath700 ft²", :raw_location=>"\n      Rental Unit in Bath Beach    "}, {:address=>"630 Lenox Avenue #9S", :price=>"$1,945", :raw_bed_bath_sqft=>"1 bed1 bath", :raw_location=>"\n      Rental Unit in Central Harlem    "}, {:address=>"676 Riverside Drive #4EE", :price=>"$2,000", :raw_bed_bath_sqft=>"1 bed1 bath", :raw_location=>"\n      Rental Unit in Hamilton Heights    "}, {:address=>"65-61 Saunders Street #4L", :price=>"$2,300", :raw_bed_bath_sqft=>"2 beds2 baths1,397 ft²", :raw_location=>"\n      Rental Unit in Rego Park    "}, {:address=>"43-08 40th Street #5L", :price=>"$2,100", :raw_bed_bath_sqft=>"1 bed1 bath", :raw_location=>"\n      Townhouse in Sunnyside    "}, {:address=>"29 Avenue B #2J", :price=>"$2,485", :raw_bed_bath_sqft=>"1 bed1 bath700 ft²", :raw_location=>"\n      Rental Unit in East Village    "}, {:address=>"325 West 45th Street #310", :price=>"$2,500", :raw_bed_bath_sqft=>"1 bed1 bath", :raw_location=>"\n      Co-op in Hell's Kitchen    "}, {:address=>"484 Humboldt Street #303", :price=>"$2,475", :raw_bed_bath_sqft=>"1 bed1 bath", :raw_location=>"\n      Rental Unit in Williamsburg    "}, {:address=>"454 West 34th Street #9B", :price=>"$2,200", :raw_bed_bath_sqft=>"1 bed1 bath", :raw_location=>"\n      Rental Unit in Hudson Yards    "}, {:address=>"48-30 40th Street #7A", :price=>"$2,200", :raw_bed_bath_sqft=>"1 bed1 bath817 ft²", :raw_location=>"\n      Rental Unit in Sunnyside    "}, {:address=>"98-01 67th Avenue #7X", :price=>"$1,950", :raw_bed_bath_sqft=>"1 bed1 bath711 ft²", :raw_location=>"\n      Rental Unit in Rego Park    "}, {:address=>"4333 46th Street #A5", :price=>"$1,950", :raw_bed_bath_sqft=>"1 bed1 bath800 ft²", :raw_location=>"\n      Co-op in Sunnyside    "}, {:address=>"408 Eighth Avenue #210", :price=>"$2,100", :raw_bed_bath_sqft=>"1 bed1 bath", :raw_location=>"\n      Condo in Midtown South    "}]
end
