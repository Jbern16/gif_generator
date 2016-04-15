class Category < ActiveRecord::Base
  has_many :gifs
  validates :name, presence: true, uniqueness: true


  def self.split_category
    split.join("+")
  end

end
