class ApplicationController < ActionController::Base

  # def get(url, params)
  #   Rails.cache.fetch([url, params], :expires => 1.hour) do
  #     HTTParty.get(url)
  #   end
  # end

  def get(url, params)
    @api_response_caching = ApiResponseCachingService.new(params[:domain], params[:type], params[:page_no])
    is_cached?(@api_response_caching) ? get_cached_results(@api_response_caching) : api_fetch(url, params, @api_response_caching)
  end

  def is_cached?(api_response_caching)
    api_response_caching.any?
  end

  def cache_results(api_response_caching)
    api_response_caching.set
  end

  def get_cached_results(url, params)
    ApiResponseCachingService.new().get
  end

  def api_fetch(url, params, api_response_caching)
    response = HTTParty.get(url)
    cache_results(api_response_caching)

    response.parsed_response
  end
end
