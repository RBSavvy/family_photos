class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def create
    @photo = Photo.create(photo_params)
    respond_to do |format|
      format.js { render layout: false}
    end
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update_attributes(photo_params)
    redirect_to photos_path, notice: "Photo was successfully updated."

  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path, notice: "Photo was successfully destroyed."
  end


  private

  def photo_params
    params.require('photo').permit(:image, :description)
  end

end