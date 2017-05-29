module ApartmentsHelper

	def mail_to_text(apartment)
		"mailto:meganlalley@gmail.com?subject=#{URI.encode(apartment.address)}&body=#{URI.encode(apartment.view_link)}"
	end

end