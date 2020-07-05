require 'rails_helper'

describe '::Api::V1::MovieController', type: :request do

  before do
    I18n.default_locale = :en
    execute_actions
  end

  let(:execute_actions) {}

  let(:invalid_params) { params = {} }

  let(:valid_params) do
    params = {
      movie: {
        name: Faker::Lorem.word,
        release_date: 2.days.ago,
        age_censure: 18,
        direction: Faker::Name.name,
        actors: {
          name: [Faker::Name.name, Faker::Name.name]
        }
      }
    }
  end

  let(:incomplete_params) do
    params = {
      movie: {
        name: Faker::Lorem.word,
        release_date: 2.days.ago,
        direction: Faker::Name.name,
        actors: {
          name: [Faker::Name.name, Faker::Name.name]
        }
      }
    }
  end

  let(:body) { JSON.parse response.body }

  context 'when create a new movie' do
    context 'when use a incomplete params' do
      let(:execute_actions) do
        post '/api/v1/movie', params: incomplete_params, headers: { 'ACCEPT' => 'application/json'}
      end

      it 'status 400 must be return' do
        expect(response.status).to eq 400
      end

      it 'Bad Request must be return in body' do
        expect(body['data']).to eq 'Bad Request'
      end

      it 'msg in body mus be Age censure can`t be empty' do
        expect(body['msg'].first).to eq 'Age censure can`t be empty'
      end

      it 'msg in body Age censure must be an integer' do
        expect(body['msg'].second).to eq 'Age censure must be an integer'
      end
    end

    context 'when use a invalid params' do
      let(:execute_actions) do
        post '/api/v1/movie', params: invalid_params, headers: { 'ACCEPT' => 'application/json'}
      end

      it 'status 400 must be return' do
        expect(response.status).to eq 400
      end

      it 'Bad Request must be return in body' do
        expect(body['data']).to eq 'Bad Request'
      end
    end

    context 'when use a valid params' do

      let(:execute_actions) do
        post '/api/v1/movie', params: valid_params, headers: { 'ACCEPT' => 'application/json'}
      end

      it 'status 201 must be return' do
        expect(response.status).to eq 201
      end

      it 'movie count must return 1' do
        expect(::Movie.count).to eq 1
      end

      it 'actor count must return 2' do
        expect(::Movie.last.actors.count).to eq 2
      end

      it 'the name returned must be the same as the parameter passed' do
        expect(body['data']['name']).to eq valid_params[:movie][:name]
      end

      it 'the release_date returned must be the same as the parameter passed' do
        expect(body['data']['release_date']).to eq valid_params[:movie][:release_date].to_date.to_s
      end

      it 'the age_censure returned must be the same as the parameter passed' do
        expect(body['data']['age_censure']).to eq valid_params[:movie][:age_censure]
      end

      it 'the direction returned must be the same as the parameter passed' do
        expect(body['data']['direction']).to eq valid_params[:movie][:direction]
      end

      it 'the actors returned must be the same as the parameter passed' do
        expect(body['data']['actors'].first['name']).to eq valid_params[:movie][:actors][:name].first
        expect(body['data']['actors'].second['name']).to eq valid_params[:movie][:actors][:name].second
      end
    end
  end
end
