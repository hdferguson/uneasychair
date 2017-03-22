class Author < ApplicationRecord
    has_one :account, as: :accountable
end
