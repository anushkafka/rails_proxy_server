class ArticleController < ActionController::Base
  def index
    cached_reponse = ApiResponseCachingService.get(cache_key(params))

    if cached_reponse
      render json: cached_reponse
    else
      response = api_fetch(params)
      ApiResponseCachingService.set(cache_key(params), response)
      
      render json: response
    end
  end

  def api_fetch(params)
    begin
      response = HTTParty.get(url, :query => permitted_params(params))
    rescue 
      return 500  # For now lets assume everything that goes wrong returns a 500
    end

    response.parsed_response
  end

  def cache_key(params)
    params[:page]
  end

  def permitted_params(params)
    params.permit(:page)
  end

  def caching_service
    @caching_service ||= ApiResponseCachingService
  end

  def url
    "https://support.zendesk.com/api/v2/help_center/en-us/articles.json"
  end
end
