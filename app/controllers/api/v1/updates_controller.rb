class Api::V1::UpdatesController < ApplicationController
	skip_before_action :verify_authenticity_token

	# 
	def dispatch
		chat_id  = chat['id']
		text = message['text']

		user

		# case text
		# when "/start" then
		# 	reply = "Ok, let's start!"
		# when "/fuck" then
		# 	reply = "Fuck you Fat Guy"
		# else
		# 	reply = "Sorry, I don't understand"
		# end

		sw = Switch.new(text)
		reply = sw.get_reply


		https_request = Httpsrequests.new 
		
		content = {
			:chat_id => chat_id,
			:text => reply
		}
		puts https_request.post('sendMessage', content)

		render json: {status: 'SUCCESS', message: 'Update Accepted'}, status: :ok
	end

	def message
		params['message']
	end

	def chat
		message['chat']
	end

	def from
		message['from'] 
	end

	def user
		@user ||=  User.find_by(telegram_id: from['id']) || register_user
	end

	def register_user
		@user = User.find_or_initialize_by(telegram_id: from['id'])
		@user.update_attributes!(first_name: from['first_name'], last_name: from['last_name'])
		puts @user
		@user.save
	end

end
