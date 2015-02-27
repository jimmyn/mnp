class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :customer
  has_and_belongs_to_many :options
  accepts_nested_attributes_for :customer

  validates :customer, presence: true, allow_blank: false

  def to_s
    "Заказ №#{id}"
  end
end