class Replay < ActiveRecord::Base
   #Tells rails to use this uploader for this model.
   mount_uploader :attachment, AttachmentUploader
   validates :name, presence: true
end
