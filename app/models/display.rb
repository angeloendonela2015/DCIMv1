class Display < ApplicationRecord
  has_one_attached :logo
  has_one_attached :bckimage

  validates :title, presence: true
  validates :subtitle, presence: true
  validates :backcolor, presence: true
  validates :logo, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  validates :bckimage, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  validate :image_file_size

  def image_file_size
    if logo.attached? && logo.byte_size > 1.megabytes
      errors.add(:image, "logo is too big")
    end
    if bckimage.attached? && bckimage.byte_size > 1.megabytes
      errors.add(:image, "background image is too big")
    end
  end

end
