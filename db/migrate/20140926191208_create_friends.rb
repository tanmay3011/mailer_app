class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.belongs_to :contact
      t.string :firstname

      t.timestamps
    end
  end
end
