class Thing < ActiveRecord::Base

  # Example usage for the `s3_relay` method to define:
  # 1) A has_many :photo_uploads relationship from Thing to S3Relay::Upload
  # 2) An after_save callback on Thing to associate its S3Relay::Upload objects
  # 3) A `new_photo_upload_uuids` virtual attribute to house the UUID(s) of
  # S3Relay::Upload objects for association after_save via #2
  s3_relay :photo_uploads, has_many: true

end
