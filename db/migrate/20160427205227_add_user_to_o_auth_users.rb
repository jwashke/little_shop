class AddUserToOAuthUsers < ActiveRecord::Migration
  def change
    add_reference :o_auth_users, :user, index: true, foreign_key: true
  end
end
