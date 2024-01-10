class SearchQuery < ApplicationRecord
    validates :query, :ip, presence: true
end
