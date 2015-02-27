class Customer < ActiveRecord::Base
  has_many :orders

  validates :name, :phone, presence: true

  def to_s
    name
  end
end
