class Track < ApplicationRecord
    belongs_to :conference
    has_one :committee
    validates :role,  :conference, presence: true
end
