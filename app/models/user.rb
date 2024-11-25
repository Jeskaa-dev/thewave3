class User < ApplicationRecord
  has_many :training_plans
  has_many :user_skills
  has_many :skills, through: :user_skills
  has_many :trainings, through: :training_plans
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
