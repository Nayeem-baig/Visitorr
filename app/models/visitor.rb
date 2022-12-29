class Visitor < ApplicationRecord
  belongs_to :space
  belongs_to :resident
  validates :name, presence: true
    validates :mob, presence: true
      validates :address, presence: true
        validates :reason, presence: true
          validates :check_in, presence: true
end
