class Track < ApplicationRecord
    belongs_to :conference
    belongs_to :account
end
