class Visitor < ApplicationRecord
  belongs_to :space
  validates :name, presence: true
    validates :mob, presence: true
      validates :address, presence: true
        validates :reason, presence: true
          validates :reason, presence: true
end
