class Review < ActiveRecord::Base
  has_attached_file :photo,
                    styles: {
                        thumb: "80x80>"
                    },
                    convert_options: {
                        thumb: "-resize 80x80^ -gravity center -extent 80x80"
                    }
  validates_attachment :photo, content_type: { :content_type => ["image/jpg", "image/jpeg", "image/png"] }
  validates_presence_of :name, :photo, :body

  default_scope { order(updated_at: :desc) }

  paginates_per 10

end
