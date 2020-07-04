require 'rails_helper'

describe '::Api::V1::MovieController', type: :request do

  before do
    execute_actions
  end

  let(:execute_actions) {}
  
  let(:movie) { FactoryBot.create(:complete_movie_18_plus) }
  let(:actor) { FactoryBot.create(:actor, movie_id: 3) }
  # let(:user)  { FactoryBot.create(:user) }

  context 'when create a new movie' do
    xcontext 'when use a invalid params' do
      let(:execute_actions) do
        post '/api/v1/movie', params: {}, headers: { 'ACCEPT' => 'application/json'}
      end

      it 'status 400 must be return' do
        expect(response.status).to eq 400
      end
    end

    context 'when use a valid params' do
      params = {
        movie: {
          name: 'filme 1',
          release_date: Date.new(),
          age_censure: 18,
          direction: 'zina',
          actors: {
            name: ['josué','biro biro']
          }
        }
      }

      let(:execute_actions) do
        post '/api/v1/movie', params: params, headers: { 'ACCEPT' => 'application/json'}
      end

      it 'status 201 must be return' do
        expect(response.status).to eq 201
      end

      it 'movie count must return 1' do
        expect(::Movie.count).to eq 1
      end

      it 'the name of the movie must be'

      it 'actor count must return 2' do
        require 'pry'; binding.pry
        expect(::Actor.count).to eq 2
      end
    end
  end
end
