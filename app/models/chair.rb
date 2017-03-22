class Chair < ApplicationRecord
    has_one :account, as: :accountable
end
