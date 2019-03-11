class ApplicationController < ActionController::Base

  def get(url, params)
    Rails.cache.fetch([url, params], :expires => 1.hour) do
      HTTParty.get(url)
    end
  end
end
