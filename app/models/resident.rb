class Resident < ApplicationRecord
  belongs_to :space
  validates :name, presence: true
    validates :mob, presence: true
      validates :email, presence: true
        validates :flat, presence: true

        def self.search_by(search_term)
          where("LOWER(name) LIKE :search_term",
          search_term: "%#{search_term.downcase}%")
      end

      paginates_per 10
end
