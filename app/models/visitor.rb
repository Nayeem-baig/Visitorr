class Visitor < ApplicationRecord
  belongs_to :space
  belongs_to :resident
  validates :name, presence: { message: "must be given!" }
    validates :mob, presence: true , length: { minimum: 10 } ,numericality: { only_integer: true }
      validates :address, presence: true
        validates :reason, presence: true
          validates :check_in, presence: true

          def self.search_by(search_term)
            where("LOWER(name) LIKE :search_term",
            search_term: "%#{search_term.downcase}%")
        end

        paginates_per 9
end
