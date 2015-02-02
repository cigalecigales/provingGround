require 'google/api_client'
require 'google_drive'

CLIENT_ID = "202145211722-62vsv29hj71lc4n0blsf8abk8753438t.apps.googleusercontent.com"
CLIENT_SECRET = "XTguC1Vybua-wJKtVx045kjX"
REFRESH_TOKEN = "1/CY0qq2VCqnBDmTtBzjfus79E3dTYOz0rlG3jLKW9SHA"

client = OAuth2::Client.new(
	CLIENT_ID, CLIENT_SECRET,
	:site => "https://accounts.google.com",
	:token_url => "/o/oauth2/token",
	:authorize_url => "/o/oauth2/auth"
)

auth_token = OAuth2::AccessToken.from_hash(client, { :refresh_token => REFRESH_TOKEN, :expires_at => 3600 })
auth_token = auth_token.refresh!

session = GoogleDrive.login_with_oauth(auth_token.token)

file_name = "Test" + Time.now.strftime('%Y-%m-%d_%H:%M:%S') + ".txt"
file = File.open(file_name, 'w')
file.puts("Test Upload!!")
file.close

session.upload_from_file(file_name, file_name, :convert => false)
