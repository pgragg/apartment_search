class AptSearch
	require 'ostruct'
	
	BASE_URL = "http://streeteasy.com/for-rent/nyc/status:open%7Cprice:1800-2500%7Cbeds%3E=1%7Cbaths%3E=1%7Camenities:elevator,laundry"

	def initialize(opts={})
		@search_results = []
		@limit = opts[:limit].to_i || 10 
	end

	def scrape_apartment_data
		page_number = 2
		structs = []
		while page_number < 30
			agent = build_agent
			url = build_url(page_number)
			agent.get(url) do |page|
				items_on_page = page.css('#result-details .item')
				items_on_page.each do |item|
					struct = OpenStruct.new
					struct.address = item.css('.details-title a').first.content
					struct.price = item.css('.price').first.content
					struct.raw_bed_bath_sqft = item.css('.details_info')[0].content
					struct.raw_location = item.css('.details_info')[1].content
					struct.link_address = item.css('.details-title a')[0]['href'].to_s rescue ''
					structs << struct
				end
			end
			sleep(rand(4..8))
			page_number += 1 
		end
		structs
	end

	private

	def build_url(page_number)
		url = BASE_URL
		if page_number > 1 
			url += "?page=#{page_number}"
		end
		url
	end

	def build_agent
		Mechanize.new {|agent| agent.user_agent_alias = 'Mac Safari'}
	end

end