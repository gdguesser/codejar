module ApplicationHelper

	def city
		request.env['ipinfo'].city if request.env['ipinfo'].city
	end

end
