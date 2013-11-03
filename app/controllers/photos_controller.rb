class PhotosController < ApplicationController
  def index
    @photos = current_album.photos
  end

  def create
    @photo = current_album.photos.create(photo_params)
    respond_to do |format|
      format.js { render layout: false}
    end
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update_attributes(photo_params)
    redirect_to album_photos_path(current_album), notice: "Photo was successfully updated."
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to album_photos_path(current_album), notice: "Photo was successfully destroyed."
  end


  private

  def photo_params
    params.require('photo').permit(:image, :description)
  end

  def current_album
    @current_album ||= Album.find(params[:album_id])
  end
  helper_method :current_album

end