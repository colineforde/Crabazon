class ProductsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @products = Product.sort_by_price
  end

  def new
    if current_user.admin?
      @category = Category.find(params[:category_id])
      @product = Product.new
    else
      redirect_to '/'
    end 
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @category = Category.find(params[:category_id])
    @product = Product.find(params[:id])
  end

  def create
    @category = Category.find(params[:category_id])
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Product successfully created!"
      redirect_to "/admin"
    else
      flash[:error] = @product.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:category_id])
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = "Product successfully updated!"
      redirect_to "/admin"
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:success] = "Product successfully deleted!"
    redirect_to '/admin'
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity, :product_image)
  end

end
