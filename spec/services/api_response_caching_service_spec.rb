require 'rails_helper'

RSpec.describe ApiResponseCachingService, :type => :service do
  context "ApiResponseCachingService" do
    it "should cache an entry and be able to retrieve" do
      params = { page: "5" }
      payload = "fake_payload"

      ApiResponseCachingService.set(params, payload)

      retrieved = ApiResponseCachingService.get(params)

      expect(retrieved).to eq(payload)
    end
  end
end