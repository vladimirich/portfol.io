class ProjectPreview < ApplicationRecord
  belongs_to :project

  # TODO: add missing png
  has_attached_file(
    :image,
    styles: { big: '1200x1200>', medium: '300x300>', thumb: '100x100>' },
    default_url: '/images/:style/missing.png'
  )
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\Z}
end
