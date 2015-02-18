class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def all

	end

	alias_method :twitter, :all
end
