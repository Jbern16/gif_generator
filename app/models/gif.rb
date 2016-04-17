class Gif < ActiveRecord::Base
  belongs_to :category
  has_many :favorites
  has_many :users, through: :favorites

  validates :image_path, presence: true, uniqueness: true
end
