require 'rails_helper'

RSpec.describe Api::V1::GenderController, type: :controller do

  let(:valid_params) { { "names": { "country": "italy", "list": [ "Giuseppe", "Giulia", "Andrea" ] } } }
  let(:invalid_params) { nil }

  let(:valid_auth_headers) { { 'X-Client-Token': APP_AUTH['auth']['tokens'].sample } }
  let(:invalid_auth_headers) { { 'X-Client-Token': 'INVALID_TOKEN' } }

  describe "#recognize" do
    context "with valid auth headers" do
      context "with valid params" do
        before do
          post '/api/v1/gender.json', valid_params, valid_auth_headers
        end

        it { expect(response).to be_success }
        it { expect(response).to render_template :recognize }

        it { expect(JSON.parse(response.body).to_json).to eq(
            {
              "names": {
                "country": DEFAULT_COUNTRY,
                "list": [
                  {
                    "name": "Giuseppe",
                    "gender": "m"
                  },
                  {
                    "name": "Giulia",
                    "gender": "f"
                  },
                  {
                    "name": "Andrea",
                    "gender": "m"
                  }
                ]
              }
            }.to_json) }

        context "without a country specified" do
          before do
            post '/api/v1/gender.json', valid_params.except(:country), valid_auth_headers
          end

          it "should default to the one set in DEFAULT_COUNTRY" do
            JSON.parse(response.body).to_hash ; expect(JSON.parse(response.body).to_hash['names']['country']).to eq(DEFAULT_COUNTRY.to_s)
          end
        end
      end

      context "with invalid params" do
        before do
          post '/api/v1/gender.json', invalid_params, valid_auth_headers
        end

        it { expect(response.status).to eq(400) }
        it { expect(response.body).to be_blank }
      end
    end

    context "with invalid auth headers" do
      before do
        post '/api/v1/gender.json', valid_params, invalid_auth_headers
      end

      it { expect(response.status).to eq(403)  }
      it { expect(response.body).to be_blank }
    end
  end
end
