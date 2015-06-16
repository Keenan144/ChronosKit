class BarcodesController < ApplicationController
require 'faker'

  def new
    @barcode = Barcode.new
  end

  def index
    @barcodes = Barcode.all
  end

  def create
    @barcode = Barcode.create(code_params)
    p params[:soss_number]

    render 'show'
  end


  def fake
  # generates FAKE data for users to test TOUCH and other scanning apps.

  @amountsoss = params[:amountsoss]
  @amountpallets = params[:amountpallets]
  @amountcartons = params[:amountcartons]

  # LIMITER, when entering a huge number the site slows for all users.
  # this will prevent it.
    render 'fake'
  end





private

  def code_params
    params.require(:barcode).permit(:soss_number)
  end

end
