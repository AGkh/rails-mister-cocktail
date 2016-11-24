class DosesController < ApplicationController
  before_action :find_cocktail, only: [:create]

  def create
    # @dose = @cocktail.doses.build(dose_params) -> pareil que les deux lignes suivantes
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
      if @dose.save
        redirect_to cocktail_path(@cocktail)
      else
        render "cocktails/show"
      end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end

# ------------------------
# SI PAGE DIFFERENTE POUR LA DOSE
# ------------------------
# def new
# end
# ------------------------
# > html :
# simple_form_for [@cocktail, Dose.new] do |f|
# f.input :description
# f.input :ingredient_id, collection: Ingredient.all
# f.submit
# end
