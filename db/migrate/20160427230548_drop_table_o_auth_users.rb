class DropTableOAuthUsers < ActiveRecord::Migration
  def change
    drop_table :o_auth_users
  end
end
