class Product < ApplicationRecord
    before_create {|product| product.title = product.title.capitalize}
    has_one_attached :image
    validates :sku, :title, presence: true
    validates :price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0}
    validates :quantity , format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0}


    def self.search(search)
        if search
            where('title  LIKE ?', "%#{search}%")
        else
            all
        end
    end
end
