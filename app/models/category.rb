class Category < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :recipes,
             dependent: :destroy

  # Indirect associations

  # Validations

  validates :name, presence: true

  # Scopes

  def to_s
    name
  end
end
