require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  describe 'usuário não autorizado' do
    it 'responde 302' do
      video = create(:video)
      get :show, params: { id: video.id }
      expect(response).to have_http_status(302)  
    end    
  end

  describe 'usuário autorizado' do
    before do
      @user = create(:user)
      @video = create(:video)       
    end

    describe 'GET index' do
      it 'rota' do
        is_expected.to route(:get, '/videos').to(action: :index)
      end

      it 'responde 200' do
        sign_in @user
        get :index
        expect(response).to have_http_status(200)
      end

      it 'array de videos' do
        sign_in @user
        get :index
        expect(assigns(:videos)).to eq([@video])
      end
    end

    describe 'GET show' do
      it 'rota' do
        is_expected.to route(:get, '/videos/1').to(action: :show, id: 1)
      end

      it 'responde 200' do
        sign_in @user
        get :show, params: { id: @video.id }
        expect(response).to have_http_status(200)
      end

      it 'registro video' do
        sign_in @user
        get :show, params: { id: @video.id }
        expect(assigns(:video)) == eq(@video)
      end

      it 'registro video não existe' do
        sign_in @user
        get :show, params: { id: rand(1000000) }
        expect(assigns(:video)) != eq(@video)
      end
    end

    describe 'GET list' do
      it 'rota' do
        is_expected.to route(:get, '/videos/list').to(action: :list)
      end

      it 'responde 200' do
        sign_in @user
        get :list
        expect(response).to have_http_status(200)
      end

      it 'array de videos' do
        sign_in @user
        get :list
        expect(assigns(:videos)) == eq([@video])
      end
    end

    describe 'POST create' do
      it 'rota' do
        is_expected.to route(:post, '/videos').to(action: :create)
      end

      it 'resposta 201' do
        video_params = attributes_for(:video)
        sign_in @user
        post :create, params: { video: video_params }
        expect(response).to have_http_status(201)
      end

      it 'válido' do
        video_params = attributes_for(:video)
        sign_in @user
        expect {
          post :create, params: { video: video_params }
        }.to change(Video, :count).by(1)
      end

      it 'inválido sem name' do
        video_params = attributes_for(:video, name: nil)
        sign_in @user
        expect {
          post :create, params: { video: video_params }
        }.not_to change(Video, :count)
      end

      it 'inválido sem url' do
        video_params = attributes_for(:video, url: nil)
        sign_in @user
        expect {
          post :create, params: { video: video_params }
        }.not_to change(Video, :count)
      end
    end

    describe 'PUT update' do
      it 'rota' do
        is_expected.to route(:put, '/videos/1').to(action: :update, id: 1)
      end

      it 'resposta 200' do
        video_params = attributes_for(:video)
        sign_in @user
        put :update, params: { id: @video.id, video: video_params }
        expect(response).to have_http_status(200)
      end

      it 'válido' do
        video_params = attributes_for(:video)
        sign_in @user
        expect {
          put :update, params: { id: @video.id, video: video_params }
        }.to change(Video, :count).by(0)
      end

      it 'válido' do
        put :update, params: { id: @video.id, 
          video: attributes_for(:video, name: 'Video Teste', url: 'http://www.filme.m3u8') }
        @video.reload
        expect(@video.name) == eq('Video Teste')
        expect(@video.url) == eq('http://www.filme.m3u8')
      end

      it 'inválido name' do
        put :update, params: { id: @video.id, 
          video: attributes_for(:video, name: 'Video Teste NOK', url: 'http://www.filme.m3u8') }
        @video.reload
        expect(@video.name) == eq('Video Teste')
        expect(@video.url) == eq('http://www.filme.m3u8')
      end

      it 'inválido url' do
        put :update, params: { id: @video.id, 
          video: attributes_for(:video, name: 'Video Teste', url: 'http://www.filmenok.m3u8') }
        @video.reload
        expect(@video.name) == eq('Video Teste')
        expect(@video.url) == eq('http://www.filme.m3u8')
      end
    end

    describe 'DELETE destroy' do
      it 'rota' do
        is_expected.to route(:delete, '/videos/1').to(action: :destroy, id: 1)
      end
    end
  end
end
