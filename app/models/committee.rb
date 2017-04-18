class Committee < ApplicationRecord
    belongs_to :conference
    belongs_to :user
    has_many :tracks
    has_many :papers
end
