class Product < ApplicationRecord
  belongs_to :brand

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }


  def as_json(options = {})
    super(options.merge(
      methods: [:brand_name],
      except: [:brand_id, :created_at, :updated_at]
    ))
  end

  def brand_name
    brand.name
  end
end
