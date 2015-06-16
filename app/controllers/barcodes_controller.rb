class BarcodesController < ApplicationController
require 'faker'

  def fake
  # generates FAKE data for users to test TOUCH and other scanning apps.

  @amountsoss = params[:amountsoss]
  @amountpallets = params[:amountpallets]
  @amountcartons = params[:amountcartons]

  # LIMITER, when entering a huge number the site slows for all users.
  # this will prevent it.
    render 'fake'
  end








end
