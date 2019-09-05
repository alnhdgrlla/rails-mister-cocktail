class DosesController < ApplicationController
  def new
    @cocktail = cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = cocktail.find(params[:cocktail_id])
    @dose = Doses.new(dose_params)
    @dose.cocktail = @cocktail_path
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      @review = Review.new
      render "cocktails/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
