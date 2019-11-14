class CatsController < ApplicationController
  before_action :find_cat, only: [:show, :edit, :update, :destroy]
  before_action :authorized, only: [:new]

  def homepage
  end

  def index
    if params[:q]
        @cats_atts = Cat.search_by_attributes(params[:q])
        @cats_owner = Cat.search_by_owner(params[:q])
        @cats_tags = Cat.search_by_tags(params[:q])
        @cats = (@cats_owner + @cats_atts + @cats_tags).uniq
      else
      @cats = Cat.all
    end
  end
  
  def new
    @cat = Cat.new
    @tags = Tag.all
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.owner_id = session[:user_id]
    if @cat.save
      redirect_to @cat
    else
      flash[:errors] = @cat.errors.full_messages
      redirect_to new_cat_path
    end
  end

  def search
    redirect_to "/cats/?q=#{params[:q]}"
  end


  def tagsearch
    @cats = Cat.select{|c| c.tags.include?(@tag)}
    render :index
  end

  def show
  end

  def edit
    @tags = Tag.all
    if session[:user_id] == @cat.owner_id
      render :edit
    else
      flash[:errors] = []
      redirect_to @cat
    end
  end
  
  def update
    if @cat.update(cat_params)
      redirect_to @cat
    else
      flash[:errors] = @cat.errors.full_messages
      redirect_to edit_cat_path(@cat)
    end
  end


  def destroy
    # @reservations = @cat.reservations
    # @reservations.each do |reservation|
    #   reservation.destroy
    # end
    @cat.destroy
    redirect_to my_profile_path
  end




  private
  
  def find_cat
    @cat = Cat.find_by(id: params[:id])
  end

  def cat_params
    params.require(:cat).permit(:name, :owner_id, :neighborhood, :image, :breed, :price, tag_ids:[], tags_attributes: [:name])
  end

  def authorized_cat_owner?
    redirect_to my_profile_path unless session[:user_id] == Cat.find(params[:id]).owner_id
  end
    
end
