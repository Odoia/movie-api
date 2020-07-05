require 'rails_helper'

describe '::Api::V1::MovieController', type: :request do

  before do
    I18n.default_locale = :en
    execute_actions
  end

  let(:execute_actions) {}

  let(:movie_18_plus) { FactoryBot.create(:complete_movie_18_plus) }
  # let(:movie_16) { FactoryBot.create(:complete_movie_up_to_16) }
  # let(:movie_14) { FactoryBot.create(:complete_movie_up_to_14) }
  # let(:movie_12) { FactoryBot.create(:complete_movie_up_to_12) }
  # let(:movie_10) { FactoryBot.create(:complete_movie_up_to_10) }
  # let(:movie_free) { FactoryBot.create(:complete_movie_with_free_classification) }

  let(:body) { JSON.parse response.body }

  context 'When given a 6 movies' do
    let(:execute_actions) do
      movie_18_plus
      # movie_16
      # movie_14
      # movie_12
      # movie_10
      # movie_free
    end

    context 'When pass a 18 into url' do
      it 'must be show all movies for 18 years plus' do
        get '/api/v1/movie/censure/18', params: {}, headers: { 'ACCEPT' => 'application/json' }
        require 'pry'; binding.pry
      end
    end
  end
end
