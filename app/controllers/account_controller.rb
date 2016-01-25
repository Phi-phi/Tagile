class AccountController < ApplicationController
  def index
    @tags = current_user.tags
    @uploads = User.find(current_user.id).uploads
  end

  def show
    if User.find(params[:id]).user_id == current_user.id
      @img = User.find(params[:id])
    end
  end

  def create_tag
    if (img = Upload.find(params[:id])).user_id == current_user.id
      @img = img
    end
    @tags = current_user.tags
    @tag_ids = img.tags.pluck(:id)
  end

  def edit_img
    @img = Upload.find(params[:id])
  end

  def edit_img_post
    logger.debug(session[:filename])
    if image_edit_params[:file] == session[:filename]
      Upload.update(image_edit_params)
    end
    #logger.debug(image_edit_params)
    logger.debug(del_tag_params)
    
  end

  def regist_tag
    if (img = Upload.find(params[:id])).user_id == current_user.id 
      @name = regist_tag_paramms[:name]
      if !current_user.tags.pluck(:name).include?(regist_tag_paramms[:name])
        img.tags.create(name: regist_tag_paramms[:name], user_id: current_user.id)
      else
        tag = Tag.where(name: regist_tag_paramms[:name], user_id: current_user.id).first
        img.tags << tag
      end
    end
  end

  def select_tag
    if ( (@tag = Tag.find(params[:tid])).user_id == current_user.id && 
      (img = Upload.find(params[:img])).user_id == current_user.id &&
      !img.tags.pluck(:id).include?(:tid) )
      img.tags << @tag
    end
  end

  def search_by_tag
    @tags = Tag.all
    if (@selected_tag = Tag.find(params[:id])).user_id == current_user.id
      @uploads = @selected_tag.uploads
    end
  end
  
  private 
  def regist_tag_paramms
    params.require(:tag).permit(:id, :name)
  end

  def image_edit_params
    params.require(:upload).permit(:name)
  end

  def del_tag_params
    params.permit(del_tag: [])
  end
end
