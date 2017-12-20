class Switch
	def initialize(text)
		@text = text
	end

	def get_reply
		case @text
		when "/start" then
			return "Ok, let's start!"
		when "/fuck" then
			return "Fuck you Fat Guy"
		else
			return "Sorry, I don't understand"
		end
	end
end