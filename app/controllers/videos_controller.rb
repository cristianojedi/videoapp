class VideosController < ApplicationController
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
    @video.destroy(params[:id])
    head :ok
  end

  private

  def set_video
    @video = current_user.videos.where(id: params[:id])
  end

  def video_params
    params.require(:video).permit(:name, :url)
  end
end
