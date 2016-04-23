class Item < ActiveRecord::Base
  validates :title,       presence: true,
                          uniqueness: true
  validates :description, presence: true
  validates :price,       presence: true
  validates :image_path,  presence: true
  has_many :orders
  has_many :users, through: :orders

  enum state: %w(active retired)
end
