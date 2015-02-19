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
end
