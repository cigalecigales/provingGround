FactoryGirl.define do
	factory :user do
		email "rspec_test@test.com"
		uid "123"
		provider "twitter"
		username "anonymous"
		confirmed_at Time.now
		#confirmation_sent_at Time.now
	end
end
