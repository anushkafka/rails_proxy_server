class ArticleController < ActionController::Base
  def index
    cached_reponse = ApiResponseCachingService.get(params)

    if cached_reponse
      render json: cached_reponse
    else
      response = api_fetch(params)
      ApiResponseCachingService.set(params, response)
      
      render json: response
    end
  end

  def api_fetch(params)
    response = HTTParty.get(url, :query => permitted_params(params))
    response.parsed_response
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
