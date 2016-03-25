class CategoriesController < ApplicationController
  def index
   	@categories = Category.all
  end

  def new
    if current_user.try(:admin?)
      @category = Category.new
    else
      redirect_to '/'
    end
  end

  def search 
    #lists the categories that match the query
    if params[:q].present?
      @categories = Category.where("name ILIKE ? ", "%#{params[:q]}%")
    else
      @categories = Category.limit(10)
    end
    render json: @categories
  end
  
  def show
    @category = Category.find(params[:id])
    redirect_to category_products_path(@category)
  end

  def edit
    @category = Category.find(params[:id])
    render 'edit'
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "New category successfully created"
      redirect_to "/admin"
    else
      flash[:error] = @category.error.full_messages.to_sentence
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "Category successfully updated!"
      redirect_to "/admin"
    else
      render 'edit'
    end
  end


  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = "Category successfully deleted!"
    redirect_to '/admin'
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end