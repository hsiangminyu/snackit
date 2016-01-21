class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  has_many :favorites
  has_many :favorite_snacks ,through: :favorites ,class_name: 'Snack', source: :snack
end