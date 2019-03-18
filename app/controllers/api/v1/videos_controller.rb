class Api::V1::VideosController < ApplicationController
  before_action :set_video, only: %i[show update destroy]
  skip_before_action :verify_authenticity_token

  def index
    @videos = Video.all
    render json: @videos, status: :ok
  end

  def list
    @videos = current_user.videos
    render json: @videos, status: :ok
  end

  def show
    render json: @video, status: :ok
  end

  def create
    @video = Video.new(video_params.merge(user: current_user))

    if @video.save
      render json: @video, status: :created
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  def update
    if @video.update(video_params.merge(user: current_user))
      render json: @video, status: :ok
    else
      render json: @video.errors, status: :unoprocessable_entity
    end
  end

  def destroy
    @video.destroy
    head :ok
  end

  private

  def set_video
    @video = Video.find_by(id: params[:id], user: current_user)
  end

  def video_params
    params.require(:video).permit(:name, :url)
  end
end
