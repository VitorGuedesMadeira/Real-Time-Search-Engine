class AddUserToQueries < ActiveRecord::Migration[7.0]
  def change
    add_reference :queries, :user, null: false, foreign_key: true
  end
end
