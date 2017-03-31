class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :accountable, polymorphic:true
  has_many :tracks
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ACCOUNT_TYPES = ["SuperAccount", "Author", "Chair", "Pcchair", "Pcmember"]
  attr_accessor :type
end
