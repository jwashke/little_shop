# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require "capybara/rails"

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

def create_items
  Item.create(
    title: "Item 1",
    description: "This is the first item",
    price: 9.99,
    image_path: "example.image")
  Item.create(
    title: "Item 2",
    description: "This is the second item",
    price: 5.99,
    image_path: "example.image/2")
end

def create_user
  User.create(
    email: "user@example.com",
    password: "password",
    first_name: "first name",
    last_name: "last name",
    address: "address",
    city: "city",
    state: "state",
    zip: "zip")
end

def create_admin
  User.create(
    email: "admin@example.com",
    password: "password",
    first_name: "first name",
    last_name: "last name",
    address: "address",
    city: "city",
    state: "state",
    zip: "zip",
    role: 1
  )
end

def create_orders
  create_items
  item = Item.first
  item2 = Item.last
  order = Order.create(date: "04/21/2016")
  user = create_user
  Invoice.create(
    user_id: user.id,
    item_id: item.id,
    quantity: 1,
    order_id: order.id
  )
  Invoice.create(
    user_id: user.id,
    item_id: item2.id,
    quantity: 1,
    order_id: order.id
  )
end

def create_admin
  User.create(
    email: "admin@example.com",
    password: "password",
    first_name: "first name",
    last_name: "last name",
    address: "address",
    city: "city",
    state: "state",
    zip: "zip",
    role: 1
  )
end
