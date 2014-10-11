class Thing < ActiveRecord::Base

  # Defines:
  # * `new_photo_upload_uuids` virtual attribute to house the UUID(s) of
  # S3::Relay::Upload objects
  # * A has_many :photo_uploads relationship to S3Relay::Upload
  # * An after_save callback to associate new uploads to this model
  s3_relay :photo_uploads, has_many: true

  # One approach to enqueueing background jobs to ingest newly uploaded files,
  # once the parent object is created/updated.  You could alternatively invoke
  # processing from a controller, service object, etc. rather than via an
  # ActiveRecord callback.
  after_save :import_photos

  private

  # Enqueue background job class to ingest the file asynchronously using
  # ActiveJob / Resque / DelayedJob, etc.
  def import_photos
    photo_uploads.pending.each do |upload|
      # Resque Example:
      #
      # Resque.enqueue(ImportThingPhoto, file.uuid)
      #
      # Your ImportThingPhoto class would then need to define a `perform` method
      # that does something like this:
      #
      # * look up the S3Relay::Upload by uuid
      # * return unless upload.pending?
      # * call upload.mark_locked!
      # * feed upload.private_url to your processing library / custom logic
      # # call upload.mark_imported!
    end
  end

end
