class RecordsController < ApplicationController
before_action :set_record, only: [:show, :edit, :update, :destroy]

  def index
   @records = Record.all.paginate( :page => params[:page], :per_page => 5 )
  end

  def new
 
    @record = Record.new
    @tag = @record.tags.build
  end

  def create
   
    @record = Record.new(record_params)
    @record.user_id = current_user.id    
    @record.save
    redirect_to records_path
  end

  def edit
  
   authorize! :edit, @record
    @comments = @record.comments.all
    @tags = @record.tags.all
  
    
  end
  
  def update
      
    if @record.update_attributes(record_params)
      
       @record.save
       redirect_to records_path
    end

  end 

  def show
   authorize! :read, @record
    @comments = @record.comments.all
   @tags = @record.tags.all
  end
 
  def destroy
   if @record.destroy
    redirect_to records_path
   end
  end

  def destroyed
    
   @d = Record.with_deleted.find(params[:id]).really_destroy!
   if @d
     redirect_to records_path
   end
  end
  
  def deleted
    @records = Record.all
   @d = @records.only_deleted
  end
 
  def restore
  
      @r = Record.with_deleted.restore(params[:id])
      if @r
       redirect_to records_path
      end

  end

  def display
   @a = Record.all.where(status:"Published")
  end

 

  private
  def set_record
    @record = Record.find(params[:id])
  end

  def record_params  
  
   params.require(:record).permit(:id, :name, :description, :username, :status, :user_id, :tags_attributes => [:id, :record_id, :tag, :tag_name], :comments_attributes => [:id, :record_id, :user_id, :comment]) 
  end
end
