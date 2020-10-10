class ErrorsController < ApplicationController
  layout 'error'

  def show
    binding.pry
    render status_code.to_s, :status => status_code
  end

  protected
  def status_code
    params[:code] || 500
  end
end