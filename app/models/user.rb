class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :prompts,
    inverse_of: :user,
    dependent: :nullify

  has_many :choices,
    inverse_of: :user,
    dependent: :nullify

  has_many :comments,
    inverse_of: :user,
    dependent: :nullify

  acts_as_voter
end
