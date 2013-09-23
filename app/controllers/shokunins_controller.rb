class ShokuninsController < ApplicationController

  before_filter do
    if params[:id]
      @shokunin = Shokunin.find params[:id]
      @prefecture = @shokunin.prefecture
      @profile = @shokunin.profile
    else
      @prefecture = Prefecture.find params[:prefecture_id]
      @shokunin = Shokunin.new
      @profile = Profile.new active: true
    end
  end

  def new
  end

  def edit
  end

  def create
    @shokunin = @prefecture.shokunins.create
    @shokunin.profiles.create shokunin_params
    redirect_to action: :edit, id: @shokunin.id
  end

  def update
    @shokunin.profiles.create shokunin_params
    redirect_to action: :edit
  end


  private
  def shokunin_params
    params.require(:shokunin).permit(:name, :contact, :content, :active)
  end

end