class Category < ActiveRecord::Base
  has_many :products
  has_many :options
  validates_presence_of :name

  def to_s
    name
  end
end
