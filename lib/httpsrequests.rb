require 'net/http'
require 'json'

class Httpsrequests
	def initialize
		@domain = 'api.telegram.org'
		@token = '502110966:AAF-Q7ypx_TBFR4sC-LeJREdZpuuCcWTxPA'
		@uri = URI.parse('https://api.telegram.org/bot502110966:AAF-Q7ypx_TBFR4sC-LeJREdZpuuCcWTxPA')
		@proxy_addr = '10.0.1.11'
		@proxy_port = 8118
		puts "11111"
		puts @uri
	end

	def post(function_name, content)
		get_complete_uri(function_name)
		header = {'Content-Type' => 'application/json'}
		content_json = content.to_json
		http = Net::HTTP.new(@uri.host, @uri.port, nil, nil)
		http.use_ssl = true
		http.start do
			http.request_post(@uri.request_uri, content_json, header) { |res|
				return res.read_body
			}
		end
	end

	def get_complete_uri(function_name)
		@uri = URI.parse('https://' + @domain + '/bot' + @token + '/' + function_name)
	end
end