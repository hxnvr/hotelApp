class Room < ApplicationRecord
  has_many :reservations, dependent: :destroy
  validates :number, presence: true
  validates :description, presence: true, length: {minimum: 10}
  validates :price, presence: true

  mount_uploader :image, ImageUploader
  mount_uploaders :attachments, ImageUploader
end
