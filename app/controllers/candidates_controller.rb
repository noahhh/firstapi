class CandidatesController < ApplicationController

  def index
    @candidates = Candidate.all

    render json: @candidates
  end

  def show
    @candidate = Candidate.find(params[:id])
    render json: @candidate
  end

  private

    def candidate_params
      params.require(:candidate).permit(:name, :party)
    end
end
