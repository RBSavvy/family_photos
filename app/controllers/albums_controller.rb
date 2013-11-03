class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def create
    album = Album.create album_params
    redirect_to album_photos_path(album)
  end

  def update
    album = Album.find params[:id]
    album.update_attributes album_params
    redirect_to albums_path
  end

  def destroy
    album = Album.find params[:id]
    album.destroy
    redirect_to albums_path
  end

  private
  def album_params
    params.require(:album).permit(:name)
  end

end
