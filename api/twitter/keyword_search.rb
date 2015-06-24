require 'twitter'

@client = Twitter::REST::Client.new do |config|
	config.consumer_key = ""
	config.consumer_secret = ""
	config.access_token = ""
	config.access_token_secret = ""
end


since_id = 0

while true do
	sleep(5)
	begin
		results = @client.search("残業 帰りたい", :count => 100, :result_type => "recent", :since_id => since_id)
		results.map do |s|
			"#{ s.id } :#{ s.user.name }: #{ s.text }: #{ s.created_at }"

			p s.id
			p "@" + s.user.name
			p s.text
			p s.created_at

			print("\n")

			since_id = s.id
		end

	rescue Twitter::Error::ClientError
		sleep(10)
		retry
	end

end
