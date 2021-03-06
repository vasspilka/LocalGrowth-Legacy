class FunCategoriesController < ApplicationController
  
  def index
  	@categories = FunCategory.all
  	@shops = FunShop.page(params[:page]).order("points desc")

    @title = "Διασκέδαση"
  	render "shared/categories_show.html.erb"
  end

  def show
  	@category = FunCategory.find(params[:id])
  	@categories = FunCategory.all
  	@shops = FunShop.page(params[:page]).where(fun_category_id: @category.id).order("points desc")

  	@title = "Διασκέδαση | #{@category.title}"
  	render "shared/categories_show.html.erb"
  end

end