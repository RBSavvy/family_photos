class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def create
    album = Album.create album_params
    redirect_to album_photos_path(album)
  end


  private
  def album_params
    params.require(:album).permit(:name)
  end

end
