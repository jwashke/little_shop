class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :first_name, presence: true
  has_many  :orders
  has_many  :order_items, through: :orders
  has_many  :items, through: :order_items

  enum role: %w(default admin)

  def self.o_auth_find_or_create_by(auth_hash)
    user = where(
      email: auth_hash[:info][:email],
      first_name: auth_hash[:info][:nickname],
    ).first
    if user.nil?
      user = create(
        email: auth_hash[:info][:email],
        first_name: auth_hash[:info][:nickname],
        password: rand(1..10_000).to_s
      )
    end
    user
  end
end
