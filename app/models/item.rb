class Item < ActiveRecord::Base
  validates :title,       presence: true,
                          uniqueness: true
  validates :description, presence: true
  validates :price,       presence: true
  # validates :image_path,  presence: true
  has_attached_file :file
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    large: '570x570>'
  }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  enum state: %w(active retired)

  def self.all_by_state
    all.order(:state)
  end

  def self.all_by_id
    all.order(:id)
  end
end
