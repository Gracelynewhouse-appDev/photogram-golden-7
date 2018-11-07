class PicturesController < ApplicationController
  
  def index
    
    @photo_list = Photo.all.order({  :created_at => :desc})
    render("pic_templates/all_photos.html.erb")
    
  end
  
  def new_form
    render("pic_templates/new_form.html.erb")
  end
  
  def create_row
    p  = Photo.new
    p.source  =  params.fetch("the_source")
    p.caption = params.fetch("the_caption")
    p.save
    
    #render("pic_templates/create_row.html.erb")
    redirect_to("https://appdev-photogram-golden-gracelyn.c9users.io/photos")
  end
  
  def show
    the_id  =  params.fetch("the_id")
    @the_photo = Photo.find(the_id)
    
    render("pic_templates/details.html.erb")
  end
  
  def edit_form
     the_id = params.fetch("an_id")
     @the_photo =Photo.find(the_id)
     render("pic_templates/prefilled_form.html.erb")
    
  end
  
  def update_photo
    the_id = params.fetch("some_id")
    p =  Photo.find(the_id)
    p.source = params.fetch("the_url")
    p.caption = params.fetch("caption")
    p.save
    
    #render("pic_templates/row_updated.html.erb")
    redirect_to("https://appdev-photogram-golden-gracelyn.c9users.io/photos/"+the_id)
  end
  
  def destroy_row
    the_id = params.fetch("bye_id")
    the_photo =  Photo.find(the_id)
    the_photo.destroy
    
    #render("pic_templates/row_deleted.html.erb")
    redirect_to("https://appdev-photogram-golden-gracelyn.c9users.io/photos")

  end
  

end
