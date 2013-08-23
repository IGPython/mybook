module ApplicationHelper

# Function to take the alert type and set class for container
	def flash_class(type)
		case type
		when :alert
			"alert-danger"
		when :notice
			"alert-success"
		end
	end
end
