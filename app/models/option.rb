class Option < ActiveRecord::Base
  has_and_belongs_to_many :products
  has_and_belongs_to_many :orders
  belongs_to :category

  validates_presence_of :name, :price, :category

  scope :ordered, -> {order(id: :asc)}

  def to_s
    name
  end

  def to_label
    "#{id}. #{name} (#{decorate.price})".html_safe
  end
end
