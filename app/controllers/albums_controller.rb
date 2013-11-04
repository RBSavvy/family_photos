class AlbumsController < ApplicationController
  def index
    set_active_action :albums
    @albums = current_family.albums
  end

  def create
    album = current_family.albums.create album_params
    redirect_to family_album_photos_path(current_family, album)
  end

  def update
    album = current_family.albums.find params[:id]
    album.update_attributes album_params
    redirect_to family_albums_path(current_family)
  end

  def destroy
    album = current_family.albums.find params[:id]
    album.destroy
    redirect_to family_albums_path(current_family)
  end

  private
  def album_params
    params.require(:album).permit(:name)
  end

end
