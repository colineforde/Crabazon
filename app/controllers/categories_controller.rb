class CategoriesController < ApplicationController
  def index
   	@categories = Category.all
  end

  def new
    if current_user.admin?
      @category = Category.new
    else
      redirect_to '/'
    end
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
    @category = Category.new(params[:id])
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
    if @category.update(product_params)
      flash[:success] = "Category successfully updated!"
      redirect_to "/admin"
    else
      render 'edit'
    end
  end

end