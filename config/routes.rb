Rails.application.routes.draw do

	root 'welcome#index'

	namespace 'api' do
		namespace 'v1' do
			post 'updates', to: 'updates#dispatch'
		end
	end
end
