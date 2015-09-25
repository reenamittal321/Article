class TagsController < ApplicationController

 before_action :set_tag, only: [:show, :edit, :update, :destroy]
  def index
   @tags = Tag.all
  end

  def new
  end

  def edit
  end

  def show
  
  @tags = Tag.all.where(tag:@tag.tag)
  
  end

  def destroy
     if @tag.destroy
       redirect_to record_path(@tag.record_id)
     end
  end

private

  def set_tag
    @tag = Tag.find(params[:id])
  end


  def tag_params
   params.require(:tag).permit(:id, :record_id, :tag, :tag_name)
  end


end
