class Space < ApplicationRecord
    belongs_to :user
    has_many :residents
    validates :name, presence: true
    validates :address, presence: true, length: { minimum: 10 }
    
end
