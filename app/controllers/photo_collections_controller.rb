class PhotoCollectionsController < ApplicationController
  before_action :set_photo_collection, only: [:show, :update, :destroy]

  # GET /photo_collections
  # GET /photo_collections.json
  def index
    @photo_collections = PhotoCollection.all

    render json: @photo_collections
  end

  # GET /photo_collections/1
  # GET /photo_collections/1.json
  def show
    photos = @photo_collection.photos.page params[:page]
    #Kaminari.paginate_array(@photo_collection.photos).page(params[:page]).per(10)
    render json: photos, :callback => params[:callback]
  end

  # POST /photo_collections
  # POST /photo_collections.json
  def create
    @photo_collection = PhotoCollection.new(photo_collection_params)

    if @photo_collection.save
     
      render json: @photo_collection, status: :created, location: @photo_collection
      @photo_collection.fetch_and_save_photos
    else
      render json: @photo_collection.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /photo_collections/1
  # PATCH/PUT /photo_collections/1.json
  def update
    @photo_collection = PhotoCollection.find(params[:id])

    if @photo_collection.update(photo_collection_params)
      head :no_content
    else
      render json: @photo_collection.errors, status: :unprocessable_entity
    end
  end

  # DELETE /photo_collections/1
  # DELETE /photo_collections/1.json
  def destroy
    @photo_collection.destroy

    head :no_content
  end

  private

    def set_photo_collection
      @photo_collection = PhotoCollection.find(params[:id])
    end

    def photo_collection_params
      params.require(:photo_collection).permit(:tag, :start_date, :end_date)
    end
end
