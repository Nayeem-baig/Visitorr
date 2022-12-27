class Space < ApplicationRecord
    belongs_to :user
    has_many :residents
    validates :name, presence: true
    validates :address, presence: true, length: { minimum: 10 }
    

    def self.search_by(search_term)
        where("LOWER(name) LIKE :search_term",
        search_term: "%#{search_term.downcase}%")
    end
end
