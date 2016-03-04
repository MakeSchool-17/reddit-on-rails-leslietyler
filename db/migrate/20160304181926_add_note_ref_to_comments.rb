class AddNoteRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :note, polymorphic: true, index: true
  end
end
