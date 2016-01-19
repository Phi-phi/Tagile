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

  def regist_tag
    if (img = Upload.find(params[:id])).user_id == current_user.id
      img.tags.create(name: regist_tag_paramms[:name], user_id: current_user.id)
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
end
