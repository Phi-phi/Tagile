class TagController < ApplicationController
  def index
    @tags = current_user.tags
  end

  def show
    if (tag = Tag.find(params[:id])).user_id == current_user.id
      @tag = tag
    end
  end

  def edit
    @tags = current_user.tags
  end


  def new
    @tag = Tag.new
  end

  def create
    Tag.create(create_tag_params)
    
    redirect_to :action => "show"
  end

  def update
    update_tags_params.map do |id, name|
      new_tag = Tag.find(id)
      if new_tag.user_id == current_user.id
        new_tag.update_attributes(name)
      end
    end
    redirect_to :action => "show"
  end

  private
  def update_tags_params
    params.permit(tags: [:id, :name])[:tags]
  end

  def create_tag_params
    params.require(:tag).permit(:name, :user_id)
  end
end
