class Review < ApplicationRecord
  belongs_to :paper
  validates_inclusion_of :score, :in => 0..10
  validates_inclusion_of :confidence, :in => 1..5
end
