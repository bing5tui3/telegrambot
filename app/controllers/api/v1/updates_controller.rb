class Api::V1::UpdatesController < ApplicationController
	skip_before_action :verify_authenticity_token
	def create
		puts params
		chat_id  = params['message']['chat']['id']
		puts chat_id
		text = params['message']['text']
		puts text

		case text
		when "/start" then
			reply = "Ok, let's start!"
		when "/fuck" then
			reply = "Fuck you Fat Guy"
		else
			reply = "Sorry, I don't understand"
		end


		https_request = Httpsrequests.new
		
		content = {
			:chat_id => chat_id,
			:text => reply
		}
		puts https_request.post('sendMessage', content)

		render json: {status: 'SUCCESS', message: 'Update Accepted'}, status: :ok
	end
end
