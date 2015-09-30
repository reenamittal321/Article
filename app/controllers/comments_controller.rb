class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  def index
    @comments = Comment.all
  end

  def new
        @comment = Comment.new
  end

  def create
@comment = Comment.new(comment_params[])
  end

  def edit
    
  end

  def update
    
    record = Record.find(@comment.record_id)
    @coment = record.comments.find(params[:id])
      if @coment.update_attributes(comment_params)
        redirect_to record_path(@comment.record_id)
      end
  end
  
  def show

  end

  def destroy

    if @comment.destroy
      redirect_to record_path(@comment.record_id)
    end
  end

  private

  def set_comment

    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:id, :record_id, :comment, :user_id)
  end

end
