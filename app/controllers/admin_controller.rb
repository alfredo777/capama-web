class AdminController < ApplicationController
  def login
  end

  def index
  end
  
  ##### se crean los post #####

  def all_post
  end

  def post
  end

  def new_post
  end

  def edit_post
  end
  
  def update_post
  end

  def delete_post
  end

  ##### manejo de archivos #######

  def files
    @pictures = Picture.all
  end

  def destroy_file_image
    @picture = Picture.find(params[:id])
    @picture.destroy
    respond_to do |format|
      format.js
    end
  end

  def create_new_image
    @picture = Picture.new
    @picture.name = params[:name]
    @picture.user_id = current_user.id
    @picture.version_img = params[:file]
    @picture.save

    @local_path = params[:local_path]
   
    respond_to do |format|
      format.js
    end
  end

  def load_image_select

    case params[:type]
      when "list"
        @route = "list_images"
        @pictures = Picture.all
      when "load"
       @route = "new_image"
       @pictures = nil
    end

    @local_path = params[:local_path]
      
    respond_to do |format|
      format.js
    end
  end

  #### tikets ######

  def tickets
    @tikets = UserHelp.paginate(:page => params[:page], :per_page => 30).order('id DESC')
  end

  def admin_tiket_show
    @ticket = UserHelp.find(params[:id])
  end


  

end
