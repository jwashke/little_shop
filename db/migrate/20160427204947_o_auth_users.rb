class OAuthUsers < ActiveRecord::Migration
  def change
    create_table :o_auth_users do |t|
      t.string :provider
      t.string :name
      t.string :email
    end
  end
end
