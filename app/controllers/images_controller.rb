class ImagesController < ApplicationController
 
  def new
    @image = Image.buildbu
  end
 
  def show
    @image = Image.find(params[:id])
  end
 
  private
 
  def image_params
    params.require(:image).permit(
      :file,
      :hint,
      :alt,
      )
  end
 
end