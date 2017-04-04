class Track < ApplicationRecord
    belongs_to :conference
    validates :role,  :conference, presence: true
end
