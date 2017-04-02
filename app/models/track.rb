class Track < ApplicationRecord
    belongs_to :conference
    belongs_to :account
    validates :role,  :conference, :account, presence: true
end
