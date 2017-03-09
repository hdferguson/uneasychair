class Review < ApplicationRecord
  belongs_to :paper
  validates_inclusion_of :score, :in => 0..10
end
