class Space < ApplicationRecord
    belongs_to :user
    has_many :residents
    has_many :visitors
    validates :name, presence: true
    validates :address, presence: true, length: { minimum: 10 }
    

    def self.search_by(search_term)
        where("LOWER(name) LIKE :search_term",
        search_term: "%#{search_term.downcase}%")
    end

    def one_space_per_user
        if user.space && user.space != self
          errors.add(:user, "already has a space")
        end
    end
end
