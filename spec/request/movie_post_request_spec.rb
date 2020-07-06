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

  let(:valid_params_with_11_actors) do
    params = {
      movie: {
        name: Faker::Lorem.word,
        release_date: 2.days.ago,
        age_censure: 18,
        direction: Faker::Name.name,
        actors: {
          name: [
           Faker::Name.name, Faker::Name.name, Faker::Name.name, Faker::Name.name,
           Faker::Name.name, Faker::Name.name, Faker::Name.name, Faker::Name.name,
           Faker::Name.name, Faker::Name.name, Faker::Name.name
        ]
        }
      }
    }
  end


  let(:incomplete_params) do
    params = {
      movie: {
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
        post '/api/v1/movies', params: incomplete_params, headers: { 'ACCEPT' => 'application/json'}
      end

      it 'status 400 must be return' do
        expect(response.status).to eq 400
      end

      it 'Bad Request must be return in body' do
        expect(body['data']).to eq 'Bad Request'
      end

      it 'msg in body -> must be Name can`t be empty' do
        expect(body['msg'].first).to eq 'Name can`t be empty'
      end

      it 'msg in body -> must be Age censure can`t be empty' do
        expect(body['msg'].second).to eq 'Age censure can`t be empty'
      end

      it 'msg in body -> Age censure must be an integer' do
        expect(body['msg'].third).to eq 'Age censure must be an integer'
      end

      it 'msg in body -> Release date can`t be empty' do
        expect(body['msg'].fourth).to eq 'Release date can`t be empty'
      end

      it 'msg in body -> Direction can`t be empty' do
        expect(body['msg'].fifth).to eq 'Direction can`t be empty'
      end

      it 'msg in body -> This name already exists' do
        post '/api/v1/movies', params: valid_params, headers: { 'ACCEPT' => 'application/json'}
        post '/api/v1/movies', params: valid_params, headers: { 'ACCEPT' => 'application/json'}

        expect(body['msg'].first).to eq 'This name already exists'
      end

      it 'msg in body -> A film can`t have more than 10 actors' do
        post '/api/v1/movies', params: valid_params_with_11_actors, headers: { 'ACCEPT' => 'application/json'}

        expect(body['msg']).to eq 'A film can`t have more than 10 actors'
      end
    end

    context 'when use a invalid params' do
      let(:execute_actions) do
        post '/api/v1/movies', params: invalid_params, headers: { 'ACCEPT' => 'application/json'}
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
        post '/api/v1/movies', params: valid_params, headers: { 'ACCEPT' => 'application/json'}
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
