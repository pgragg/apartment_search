class PageIterator

	def self.iterate
		i = 1
		page_response = nil
		while page_response != "error"
			page_response = ( Streeteasy.interpret_page(Streeteasy.grab_page(i)) rescue "error" )
			PageResponseIterator.iterate(page_response)
			i += 1
		end
	end

end