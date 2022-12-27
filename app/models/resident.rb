class Resident < ApplicationRecord
  belongs_to :space
  validates :name, presence: true
    validates :mob, presence: true
      validates :email, presence: true
        validates :flat, presence: true

      # for search filter
      #   def self.search_by(search_term)
      #     where("LOWER(name) LIKE :search_term OR LOWER(flat) LIKE :search_term",
      #     search_term: "%#{search_term.downcase}%")
      # end
end
