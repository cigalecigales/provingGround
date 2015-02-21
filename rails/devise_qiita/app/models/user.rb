class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
				 :confirmable, :lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter]

	def self.from_omniauth(auth)
		where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |user|
			user.provider = auth["provider"]
			user.provider = auth["uid"]
			user.username = auth["info"]["nickname"]
		end
	end

	def self.new_with_session(params, session)
		if session["devise.user_attributes"]
			new(session["devise.user_attributes"], without_protection: true) do |user|
				user.attributes = params
				user.valid?
			end
		else
			super
		end
	end
end
