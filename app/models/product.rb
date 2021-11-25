class Product < ApplicationRecord
    before_create {|product| product.title = product.title.capitalize!}
    has_one_attached :image
    belongs_to :category, optional: true
    has_many :types,dependent: :destroy
    validates :sku, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/}
    validates :title, presence: true, format: {with: /\A(?:[A-Za-z]+)(?:[A-Za-z0-9 _]*)\z/}
    validates :price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0}
    validates :quantity , format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0}
    accepts_nested_attributes_for :types


    def self.search(search)
        if search
            where('title  LIKE ?', "%#{search}%")
        else
            all
        end
    end
end
