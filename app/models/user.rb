class User < ApplicationRecord
  # include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # include DeviseTokenAuth::Concerns::User
  has_many :reservations

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable, :validatable,
         jwt_revocation_strategy: JwtDenylist
end
