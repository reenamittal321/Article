class Photo < ActiveRecord::Base

   mount_uploader :avatar, AvatarUploader
   
   
    belongs_to :Record
  
end
