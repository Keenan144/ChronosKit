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

  def generate
    @amount = params[:amount]
    @barcode = Barcode.new
    if @amount != nil
      @amount.to_i.times do |x|
      last_barcode = Barcode.last.soss_number
        Barcode.create(soss_number: last_barcode.to_i + 1).save
      end
    @barcodes = Barcode.last(params[:amount].to_i)
    render 'results'
    end
  end


  def search
    @barcode = Barcode.find_by(soss_number: params[:number])
    if @barcode
      render 'show'
    end
    @error = " " + params[:number].to_s + " does not exist in the database"
  end

  def last
    @barcodes = Barcode.last(params[:number].to_i)
    if @barcodes
      render 'results'
    end
  end

  def values

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
