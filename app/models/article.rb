class Article < ActiveRecord::Base
  has_attached_file :image,
                    styles: {
                        resized: "625x290",
                        thumb: "500x290",
                        large: "1020x600"
                    }
  validates_attachment :image, content_type: { :content_type => ["image/jpg", "image/jpeg", "image/png"] }
  validates_presence_of :title, :body, :image

  default_scope { order(updated_at: :desc) }

  paginates_per 11

  def to_s
    title
  end
end
