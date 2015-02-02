require 'google/api_client'
require 'google_drive'

CLIENT_ID = ""
CLIENT_SECRET = ""
REFRESH_TOKEN = ""

client = OAuth2::Client.new(
	CLIENT_ID, CLIENT_SECRET,
	:site => "https://accounts.google.com",
	:token_url => "/o/oauth2/token",
	:authorize_url => "/o/oauth2/auth"
)

auth_token = OAuth2::AccessToken.from_hash(client, { :refresh_token => REFRESH_TOKEN, :expires_at => 3600 })
auth_token = auth_token.refresh!

session = GoogleDrive.login_with_oauth(auth_token.token)

for file in session.files
	puts file.title
end
