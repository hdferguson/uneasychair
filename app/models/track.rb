class Track < ApplicationRecord
    belongs_to :conference
    belongs_to :committee
    validates :role,  :conference, presence: true
end
