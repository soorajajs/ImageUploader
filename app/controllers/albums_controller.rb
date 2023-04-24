class AlbumsController < ApplicationController
  before_action :require_login
    def index
        @albums = Album.all
      end
    
      def show
        @album = Album.find(params[:id])
        @image = @album.images
      end
    
      def new
        @album = Album.new
      end
    
      def create
        @album =  current_user.albums.build(album_params)
        if @album.save
          redirect_to @album, notice: 'Album was successfully created.'
        else
          render :new
        end
      end

      def edit
        @album = Album.find(params[:id])
      end
    
      def update
        @album = Album.find(params[:id])
        if @album.update(album_params)
          redirect_to @album
        else
          render :edit
        end
      end
      private
    
      def album_params
        params.require(:album).permit(:name, :owner, :max_images)
      end
end