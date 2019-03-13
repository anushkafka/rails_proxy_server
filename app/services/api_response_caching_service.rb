require "mini_cache"

class ApiResponseCachingService
  def self.set(params, payload)
    cache.set(key(params), payload, expires_in: 3600)
  end

  def self.get(params)
    cache.get(key(params))
  end

  private

  def self.key(params)
    params[:page]
  end

  def self.cache
    @cache ||= MiniCache::Store.new
  end
end
