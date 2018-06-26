class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
    attachment :profile_image
    has_many :books

    validates :name,
    length: {minimum: 2, maximum: 20}
end

