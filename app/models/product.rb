class Product < ApplicationRecord
    validates_presence_of :title, :description
    validates :qty, numericality: {greater_than_or_equal_to: 0}
    has_one_attached :image
end
