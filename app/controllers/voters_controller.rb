class VotersController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_filter :load_voter, only: [:show, :update]
  before_filter :restrict_access_to_voter, only: [:update]

  def show
    @voter = Voter.find(params[:id])

    render json: @voter
  end

  def create
    @voter = Voter.new(voter_params)

    if @voter.save
      render json: @voter.as_json(include_token: true), status: :created, location: @voter
    else
      render json: @voter.errors, status: :unprocessable_entity
    end
  end

  def update
    @voter = Voter.find(params[:id])

    if @voter.update(voter_params)
      head :no_content
    else
      render json: @voter.errors, status: :unprocessable_entity
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

  def voter_params
    params.require(:voter).permit(:name, :party)
  end
end
