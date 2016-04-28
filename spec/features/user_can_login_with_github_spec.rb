require "rails_helper"

RSpec.feature "User can login with Github" do
  scenario "it should create a new user" do
    visit github_login_path

    expect(current_path).to eq(dashboard_path)
    expect(User.all.count).to eq(1)
  end
end
