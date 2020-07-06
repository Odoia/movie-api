require 'rails_helper'

describe '::Api::V1::MovieController', type: :request do

  before do
    I18n.default_locale = :en
    execute_actions
  end

  let(:execute_actions) {}

  let(:movie_18) { FactoryBot.create(:complete_movie_18_plus) }
  let(:movie_16) { FactoryBot.create(:complete_movie_up_to_16) }
  let(:movie_14) { FactoryBot.create(:complete_movie_up_to_14) }
  let(:movie_12) { FactoryBot.create(:complete_movie_up_to_12) }
  let(:movie_10) { FactoryBot.create(:complete_movie_up_to_10) }
  let(:movie_free) { FactoryBot.create(:complete_movie_with_free_classification) }

  let(:body) { JSON.parse response.body }

  context 'When use a invalid url' do
    let(:execute_actions) do
      get '/api/v1/movies/censure/asdas', params: {}, headers: { 'ACCEPT' => 'application/json' }
    end

    it 'must be return status 400' do
      expect(response.status).to eq 400
    end

    it 'must be return Not Found error' do
      expect(body['data']).to eq 'Bad Request'
    end

    it 'must be return Age must be a integer in msg' do
      expect(body['msg']).to eq 'Age must be a integer'
    end
  end

  context 'When use a valid url' do
    context 'When given a 6 movies' do
      let(:actions_setup) do
      end

      context 'When pass a age 18 into url' do
        let(:execute_actions) do
          movie_18
          movie_16
          movie_14
          movie_12
          movie_10
          movie_free
          get '/api/v1/movies/censure/18', params: {}, headers: { 'ACCEPT' => 'application/json' }
        end

        it 'must be return a status 200' do
          expect(response.status).to eq 200
        end

        it 'count must be 6' do
          expect(body['data'].count).to eq 6
        end

        it 'first movie name must be equal a movie_18' do
          expect(body['data'].first['name']).to eq movie_18.name
        end

        it 'actor count must be 3' do
          expect(body['data'].first['actors'].count).to eq 3
        end
      end

      context 'When pass a age 16 into url' do
        let(:execute_actions) do
          movie_18
          movie_16
          movie_14
          movie_12
          movie_10
          movie_free
          get '/api/v1/movies/censure/16', params: {}, headers: { 'ACCEPT' => 'application/json' }
        end

        it 'status must be return 200' do
          expect(response.status).to eq 200
        end

        it 'count must be return 5' do
          expect(body['data'].count).to eq 5
        end

        it 'first movie name must be equal a movie_16' do
          expect(body['data'].first['name']).to eq movie_16.name
        end

        it 'actor count must be 3' do
          expect(body['data'].first['actors'].count).to eq 3
        end
      end

      context 'When pass a age 14 into url' do
        let(:execute_actions) do
          movie_18
          movie_16
          movie_14
          movie_12
          movie_10
          movie_free
          get '/api/v1/movies/censure/14', params: {}, headers: { 'ACCEPT' => 'application/json' }
        end

        it 'status must be return 200' do
          expect(response.status).to eq 200
        end

        it 'count must be return 4' do
          expect(body['data'].count).to eq 4
        end

        it 'first movie name must be equal a movie_14' do
          expect(body['data'].first['name']).to eq movie_14.name
        end

        it 'actor count must be 3' do
          expect(body['data'].first['actors'].count).to eq 3
        end
      end

      context 'When pass a age 12 into url' do
        let(:execute_actions) do
          movie_18
          movie_16
          movie_14
          movie_12
          movie_10
          movie_free
          get '/api/v1/movies/censure/12', params: {}, headers: { 'ACCEPT' => 'application/json' }
        end

        it 'status must be return 200' do
          expect(response.status).to eq 200
        end

        it 'count must be return 3' do
          expect(body['data'].count).to eq 3
        end

        it 'first movie name must be equal a movie_12' do
          expect(body['data'].first['name']).to eq movie_12.name
        end

        it 'actor count must be 3' do
          expect(body['data'].first['actors'].count).to eq 3
        end
      end

      context 'When pass a age 10 into url' do
        let(:execute_actions) do
          movie_18
          movie_16
          movie_14
          movie_12
          movie_10
          movie_free
          get '/api/v1/movies/censure/10', params: {}, headers: { 'ACCEPT' => 'application/json' }
        end

        it 'status must be return 200' do
          expect(response.status).to eq 200
        end

        it 'count must be return 2' do
          expect(body['data'].count).to eq 2
        end

        it 'first movie name must be equal a movie_10' do
          expect(body['data'].first['name']).to eq movie_10.name
        end

        it 'actor count must be 3' do
          expect(body['data'].first['actors'].count).to eq 3
        end
      end

      context 'When pass a age < 10 into url' do
        let(:execute_actions) do
          movie_18
          movie_16
          movie_14
          movie_12
          movie_10
          movie_free
          get '/api/v1/movies/censure/9', params: {}, headers: { 'ACCEPT' => 'application/json' }
        end

        it 'status must be return 200' do
          expect(response.status).to eq 200
        end

        it 'count must be return 1' do
          expect(body['data'].count).to eq 1
        end

        it 'name must be equal movie_free' do
          expect(body['data'].first['name']).to eq movie_free.name
        end

        it 'actor count must be 3' do
          expect(body['data'].first['actors'].count).to eq 3
        end
      end
    end
  end
end
