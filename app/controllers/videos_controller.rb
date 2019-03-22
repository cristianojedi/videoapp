class VideosController < ApplicationController
  before_action :set_video, only: %i[show update edit destroy]

  def index
    @videos = Video.all
  end

  def list
    @videos = current_user.videos
  end

  def show
  end

  def view
    @video = Video.find(params[:id])
  end

  def new
    @video = Video.new
  end

  def edit
  end

  def create
    @video = Video.new(video_params.merge(user: current_user))
    respond_to do |format|
      if @video.save
        format.html { redirect_to list_videos_path, notice: 'Vídeo cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to list_videos_path, notice: 'Vídeo alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to list_videos_path, notice: 'Vídeo excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_video
    @video = Video.find_by(id: params[:id], user_id: current_user.id)
  end

  def video_params
    params.require(:video).permit(:name, :url)
  end
end
