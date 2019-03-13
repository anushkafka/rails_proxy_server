require 'rails_helper'

RSpec.describe ApiResponseCachingService, :type => :service do
  context "ApiResponseCachingService" do
    it "should cache an entry and be able to retrieve" do
      key = "fake_key"
      payload = "fake_payload"

      ApiResponseCachingService.set(key, payload)

      retrieved = ApiResponseCachingService.get(key)

      expect(retrieved).to eq(payload)
    end
  end
end