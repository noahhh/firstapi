class VotesController < ApplicationController
  before_filter :load_voter, only: [:create]
  before_filter :restrict_access_to_voter, only: [:create]

  # def index
  #   @votes = Vote.all
  #
  #   render json: @votes
  # end

  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      render json: @vote, status: :created, location: @vote
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  private
  def load_voter
    @voter = Voter.find(params[:id])
  end

  def restrict_access_to_voter
    authenticate_or_request_with_http_token do |token, options|
      @voter.token == token
    end

    unless @voter.token == params[:token]
      render nothing: true, status: :unauthorized
    end
  end

    def vote_params
      params.require(:vote).permit(:voter, :candidate)
    end
end
