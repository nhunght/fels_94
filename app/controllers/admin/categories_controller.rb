class Admin::CategoriesController < ApplicationController
  before_action :logged_in_user, :admin_user

  def index
    @categories = Category.paginate page: params[:page], per_page: 5
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Category created!"
      redirect_to admin_root_url
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "deleted"
    redirect_to admin_root_path
  end

  private

  def category_params
    params.require(:category).permit :name, :description
  end
end