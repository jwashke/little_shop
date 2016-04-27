class User < ActiveRecord::Base
  has_secure_password

  # validates :email, presence: true, uniqueness: true
  # validates :password, presence: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :address, presence: true
  # validates :city, presence: true
  # validates :state, presence: true
  # validates :zip, presence: true
  has_many :orders
  has_many :order_items, through: :orders
  has_many :items, through: :order_items

  enum role: %w(default admin)

  def self.create_from_omniauth(auth_hash)
    self.create(provider: auth_hash[:provider],
                uid: auth_hash[:uid],
                first_name: auth_hash[:info][:name])
    end

end
