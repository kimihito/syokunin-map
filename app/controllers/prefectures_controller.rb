class PrefecturesController < ApplicationController
  def show
    @prefecture = Prefecture.find params[:id]
    @shokunins = @prefecture.shokunins.order 'updated_at DESC'
  end
end