class Product < ApplicationRecord
    validates_presence_of :title
    validates_presence_of :description
    validates :qty, numericality: {greater_than_or_equal_to: 0}
end
