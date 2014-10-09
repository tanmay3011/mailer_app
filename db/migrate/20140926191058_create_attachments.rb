class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :filename
      t.string :content
      t.string :type
      t.belongs_to :email
      # t.references :avatar, polymorphic: true
      t.timestamps
    end
  end
end
