class ProductImage < ActiveRecord::Base
  belongs_to :product
  has_attached_file :image,
                    styles: {
                        thumb: "249x197>",
                        medium: "419x285>"
                    },
                    convert_options: {
                        thumb: "-resize 249x197^ -gravity center -extent 249x197",
                        medium: "-resize 419x285^ -gravity center -extent 419x285"
                    },
                    default_url: ':style/product-default.jpg'

  validates_attachment :image, content_type: { :content_type => ["image/jpg", "image/jpeg", "image/png"] }

  default_scope{ order(created_at: :asc)}
end
