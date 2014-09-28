class CreateReceivers < ActiveRecord::Migration
  def change
    create_table :receivers do |t|
      t.belongs_to :maeils
      t.belongs_to :mailbox

      t.timestamps
    end
  end
end
