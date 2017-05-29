require 'rails_helper'

RSpec.describe AptSearch do 

	context 'Parsing html from a passed in page' do 

		let(:html){File.open(Rails.root.join('spec', 'stubs', 'html.txt'), 'r').read}

		it 'Correctly gets apartment info' do 
			data = AptSearch.new.get_apartment_data_from_raw_html(html)
			expect(data.count).to eq(13)
		end

		it 'feeds into the PageResponseIterator' do
			data = AptSearch.new.get_apartment_data_from_raw_html(html)
			PageResponseIterator.iterate(data)
			expect(Apartment.count).to eq(13)
		end
	end

end
