class Item < ActiveRecord::Base
  validates :title,       presence: true,
                          uniqueness: true
  validates :description, presence: true
  validates :price,       presence: true
  validates :image_path,  presence: true

  enum state: %w(active retired)

  def self.all_by_state
    all.order(:state)
  end

  def self.all_by_id
    all.order(:id)
  end
end
