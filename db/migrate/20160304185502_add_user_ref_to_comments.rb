class AddUserRefToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user, :refereces
  end
end
