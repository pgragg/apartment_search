class Streeteasy
	BASE_URL = "http://streeteasy.com"
	RENT_URL = "http://streeteasy.com/for-rent/nyc/status:open%7Cprice:1800-2400%7Cbeds%3E=1%7Cbaths%3E=1%7Camenities:elevator,laundry"
	# Fetch and parse HTML document
	def self.grab_page( page = 1, url = RENT_URL )
		url = "#{RENT_URL}?page=#{page}"
		Nokogiri::HTML(open(url))
	end

	def self.interpret_page(page)
		output = {}
		page.search('.details-title a').each do |title|
			next if title.content.include? "SAVE"
			output[title.content] = {:href => title.attributes["href"].value}
		end
		output
	end

	def self.update_apartment_price(apartment)
		return "error" unless apartment.link_address.present?
		page = Nokogiri::HTML(open("#{BASE_URL}#{apartment.link_address}"))
		page.search('.price').each do |price|
			price = price.content.gsub('for rent', '').gsub("\n", "").strip.gsub('$', '').gsub(',', '')
			apartment.update_attributes(price: price)
		end
	end

	def self.update_apartment_neighborhood(apartment)
		return "error" unless apartment.link_address.present?
		page = Nokogiri::HTML(open("#{BASE_URL}#{apartment.link_address}"))
		page.search('.details_info span.nobreak a').each do |neighborhood|
			apartment.update_attributes(neighborhood: neighborhood.content)
		end
	end

	def self.update_apartment_address(apartment)
		
	end

end