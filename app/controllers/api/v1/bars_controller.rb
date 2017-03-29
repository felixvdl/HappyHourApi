class Api::V1::BarsController < ApplicationController
  respond_to :json
  def index
    debugger
    location = bar_params[:location]
    debugger

    render json: bars
  end
  protected
     params.require(:bar).permit(:location)
  end

end
