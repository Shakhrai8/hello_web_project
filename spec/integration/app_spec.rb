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
      response = get('/hello?name=Leo')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Hello Leo!')
    end
  end

  context "GET /names" do
    it "should return the list of names" do
      response = get('/names')

      expect(response.status).to eq(200)
      expect(response.body).to eq("Julia, Mary, Karim")
    end
  end
end