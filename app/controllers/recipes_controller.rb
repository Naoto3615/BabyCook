class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.order(created_at:"DESC")
  end

  def new
    @recipes = Recipe.new
  end

  def create
   @recipes = current_user.recipes.build(recipe_params)
    if @recipes.save
      flash[:register] = "投稿できました！"
      redirect_to root_path
    else
      flash[:false] = "レシピの投稿に失敗しました"
      redirect_to root_path
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user = User.find_by(id: @recipe.user_id)
    @comment = Comment.new
    @comments = @recipe.comments
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])

  end

  def update
    @recipe = Recipe.find_by(id:params[:id])
    @recipe.update(recipe_params)
    if @recipe.save
      redirect_to "/"
    else
      redirect_to("/recipes/#{@recipe.id}/edit")
    end
  end

  def destroy
    @recipe = Recipe.find_by(id:params[:id])
    if @recipe.user_id == current_user.id
      @recipe.destroy
      redirect_to root_path
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :content, :recipe_image)
  end
end


