class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  MAX_MATERIAL_NUM = 5
  MAX_PROCESS_NUM = 5
  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    MAX_PROCESS_NUM.times { @recipe.recipe_processes.build }
    MAX_MATERIAL_NUM.times { @recipe.materials.build }
  end

  # GET /recipes/1/edit
  def edit
    (MAX_PROCESS_NUM-@recipe.recipe_processes.length).times { @recipe.recipe_processes.build }
    (MAX_MATERIAL_NUM-@recipe.materials.length).times { @recipe.materials.build }
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'レシピの投稿が完了しました' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'レシピを更新しました' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'レシピは削除されました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
#    def recipe_params
#      params.require(:recipe).permit(:title, :description, :expense, :time, :memo)
#    end

    private
    def recipe_params
      params.require(:recipe).permit(
       :title,
       :description,
       :expense,
       :time,
       :memo,
       :photo,
       tag_ids: [],
       recipe_processes_attributes: [
         :id,
         :text
       ],
       materials_attributes: [
         :id,
         :recipe_id,
         :name,
         :amount
       ]
      )
    end

end
