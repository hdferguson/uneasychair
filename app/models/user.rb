class User < ApplicationRecord
    has_one :account, as: :accountable
    has_many :tracks
end
