# OpinionsController
#
class OpinionsController < ApplicationController
  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = Opinion.create(opinion_params)
    redirect_to @opinion
  end

  def show
    @opinion = Opinion.find(params[:id])
  end

  private

  def opinion_params
    params.require(:opinion).permit(:body)
  end
end
