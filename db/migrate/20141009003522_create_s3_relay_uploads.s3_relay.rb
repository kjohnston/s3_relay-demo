# This migration comes from s3_relay (originally 20141009000804)
class CreateS3RelayUploads < ActiveRecord::Migration
  def change
    create_table :s3_relay_uploads do |t|
      t.string :uuid
      t.text :filename
      t.text :public_url
      t.string :state
      t.datetime :uploaded_at
      t.datetime :processed_at

      t.timestamps
    end
  end
end
