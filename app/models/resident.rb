class Resident < ApplicationRecord
  belongs_to :space
  validates :name, presence: true
    validates :mob, presence: true
      validates :email, presence: true
        validates :flat, presence: true

end
