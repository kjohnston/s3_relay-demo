# This migration comes from s3_relay (originally 20141009000804)
class CreateS3RelayUploads < ActiveRecord::Migration
  def change
    create_table :s3_relay_uploads do |t|
      t.string :parent_type
      t.integer :parent_id
      t.binary :uuid, length: 16
      t.text :filename
      t.text :public_url
      t.string :state
      t.json :data
      t.datetime :uploaded_at
      t.datetime :locked_at
      t.datetime :imported_at

      t.timestamps
    end
  end
end
