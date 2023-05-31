require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) {Application.new}

  context "GET /" do
    it "returns 200 OK" do
      response = get('/')

      expect(response.status).to be(200)
    end
  end

  context "GET /hello" do
    it "should return 'Hello, Leo'" do
      response = get('/hello', name: 'Hunor')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Hello, Hunor!</h1>')
    end
  end

  context "GET /names" do
    it "should return the list of names" do
      response = get('/names')

      expect(response.status).to eq(200)
      expect(response.body).to eq("Julia, Mary, Karim")
    end
  end

  context "POST /sort-names" do
    # it 'returns a sorted list of names' do
    #   response = post('/sort-names?names=Joe')

    #   expect(response.status).to eq(200)
    #   expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
    # end

    it 'returns a sorted list of names' do
      names = ['John', 'Alice', 'David', 'Mary', 'Robert']
      expected_response = names.sort
  
      post '/sort-names', { names: names }
  
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq(expected_response.join(','))
    end
  end
end