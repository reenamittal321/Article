class Tag < ActiveRecord::Base
 attr_accessor :tag_name
  before_save :change
  
  belongs_to :record

  def change

   if tag_name
        
      a = tag_name.split(",")
           
       @d = Record.find(record_id)
        a.each do |p|
         if (a.first == p)
           self.tag = p
           else  
            @d.tags.new(:tag => p).save 
         end        
        end
    end
        
  end
  
   
end
