class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :update, :destroy]
  before_filter :load_collection
  # GET /photo_collection/1/photos
  # GET /photo_collection/1/photos.json
  def index
   
    @photos = @photo_collection.photos.page params[:page]
    response.headers["X-total"] = @photos.total_count.to_s
    render json: @photos, :callback => params[:callback]
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    render json: @photo_collection.photos.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      render json: @photo, status: :created, location: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])

    if @photo.update(photo_params)
      head :no_content
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy

    head :no_content
  end

  private

    def load_collection
       @photo_collection = PhotoCollection.find(params[:photo_collection_id])
     end



    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:username, :src_link, :native_link)
    end

end
