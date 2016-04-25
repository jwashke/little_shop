class AddFileToItems < ActiveRecord::Migration
  def change
    add_attachment :items, :file
  end
end
