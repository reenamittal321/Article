class PhotosController < ApplicationController
before_action :set_photo, only: [:show, :edit, :update, :destroy]

 def index
  @photos = Photo.all
 end


 def new
 end
 
 def create
 end
  
 def show
 end 

 def destroy
  if @photo.destroy
    redirect_to edit_record_path(@photo.record_id) 
  end
 end

 private
 def set_photo
  @photo = Photo.find(params[:id])
 end

 def photo_params
  params.require(:photo).permit(:id, :record_id, :avatar)
 end
end