class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :probe, dependent: :nullify
  has_one :hosted_study, dependent: :nullify, :class_name => "Study"
  belongs_to :study
end
