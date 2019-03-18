class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :trackable, :validatable
  has_many :videos
 end
