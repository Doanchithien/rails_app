class Type < ApplicationRecord
    belongs_to :product, optional: true
    has_many :properties, dependent: :destroy
    has_one_attached :image 
    accepts_nested_attributes_for :properties
end
