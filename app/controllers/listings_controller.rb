class ListingsController < ApplicationController

  # /listings
  def index
    @listings = Listing.all
  end

  # /listings/:id
  def show
    @listing = Listing.find(params[:id])
  end

  # /listings/new
  def new
    @listing = Listing.new
  end

  # /listings
  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to @listing
    else
      render 'new'
    end
  end

  # /listings/:id/edit
  def edit
    @listing = Listing.find(params[:id])
  end

  # /listings/:id
  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to @listing, notice: "Success!"
    else
      render 'edit'
    end
  end

  def destroy
    Listing.find(params[:id]).destroy
    redirect_to root_path
  end

  private

    def listing_params
      params.require(:listing).permit(:title, :description, :price, :city, :country, :bed_no, {photos: []})
    end
end
