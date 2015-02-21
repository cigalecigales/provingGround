require 'rails_helper'

describe "twitter login test" do
	before do
		OmniAuth.config.test_mode = true
		FactoryGirl.create(:user)
		OmniAuth.config.mock_auth[:twitter] = {
			"uid" => "123",
			"provider" => "twitter",
			"info" => { 
				"nickname" => "anonymous"
			}
		}
		visit user_omniauth_authorize_path(:twitter)
	end

	after do
		OmniAuth.config.test_mode = false
	end

	describe "after login" do
		before{ visit "/pages/show" }
		subject{ page }

		it{ should have_link('ログアウト') }
	end
end
