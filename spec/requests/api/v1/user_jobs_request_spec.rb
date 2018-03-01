require 'rails_helper'

describe "Jobs API" do
  context "HTTP GET" do
    it "returns a list of jobs" do
      create_list(:job, 3)

      get '/api/v1/jobs'

      expect(response).to be_success 

      items =JSON.parse(response.body)

      expect(items.count).to eq(3)
    end
  end
end
