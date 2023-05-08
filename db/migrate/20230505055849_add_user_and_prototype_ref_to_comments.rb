class AddUserAndPrototypeRefToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :user, foreign_key: true
    add_reference :comments, :prototype, foreign_key: true
  end
end
