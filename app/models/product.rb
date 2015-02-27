class Product < ActiveRecord::Base
  has_many :product_images
  belongs_to :category
  has_and_belongs_to_many :options
  accepts_nested_attributes_for :product_images, allow_destroy: true

  validates_presence_of :name, :price
  paginates_per 16

  default_scope { order(index: :desc) }

  scope :featured, -> { where(featured: true) }
  scope :in_price_range, -> (min, max) {
    min.present? && max.present? ? where(price: min..max) : all
  }
  scope :in_category, -> (id) {
    id.present? ? where(category_id: id) : all
  }

  def to_s
    name
  end

  def cover
    product_images.first_or_create.image
  end

  def self.price_range
    {
        min: BigDecimal(self.pluck(:price).min).floor(-3).to_i,
        max: BigDecimal(self.pluck(:price).max).ceil(-3).to_i
    }
  end

  def self.text_search(query)
    if query.present?
      where("name @@ :q or description @@ :q", q: query)
    else
      all
    end
  end

end
