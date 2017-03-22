class Conference < ApplicationRecord
    validates :name, presence: true# Make sure the owner's name is present.
    validates :name, uniqueness: true
    has_many:papers
end
