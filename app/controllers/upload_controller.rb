class UploadController < ApplicationController
  def index
    @images = current_user.uploads
  end

  def edit
    @upload = Upload.new
  end

  def new
    @file = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    @upload.save!

    redirect_to :account
  end

  def show
    if (img = Upload.find(params[:id])).user_id == current_user.id
      @image = img
    end
  end

  private 
  def upload_params
    params.require(:upload).permit(:name, :file, :user_id)
  end

end
