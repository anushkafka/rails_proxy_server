require "mini_cache"

class ApiResponseCachingService
  def self.set(key, payload)
    if key
      cache.set(key, payload, expires_in: 3600)
    end
  end

  def self.get(key)
    if key
      cache.get(key)
    end
  end

  private

  def self.cache
    @cache ||= MiniCache::Store.new
  end
end
