class ImagesController < ApplicationController
  before_action :require_login
  before_action :set_album, only: [:new, :create]
  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end 
  
  def create
    binding.pry
      #  @album = Album.find(params[:album_id])
      #  image_params = params.require(:image).permit(:image, :caption, :album_id)
       # @image = @album.images.build(image: image_params[:image], caption: image_params[:caption], album_id: image_params[:album_id])
      @image = @album.images.build(image_params)
    
 

        if @image.save
         
          redirect_to @album, notice: 'Image was successfully uploaded.'
        else
          @images = @album.images.order(created_at: :desc).limit(25)
          render 'albums/show'
        end
      end
    def destroy
      @image= Image.find(params[:id])
      @image.destroy
      redirect_to @image.album
    end
      private
    
      def image_params
        params.require(:image).permit(:photo_name, :caption, :album_id)
      end

      def set_album
        @album = Album.find(params[:album_id])
      end
end