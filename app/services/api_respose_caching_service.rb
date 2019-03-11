class ApiResponseCachingService

  def initialize(domain, type, page_number)
    @key = "#{domain}_#{type}_#{page_number}"    
  end

  def set(time = Time.now)
    REDIS.set("last_call_#{@key}", time.to_i, :ex => 1.hour)
    REDIS.incr("count_#{@key}")
    true
  end

  def get
    Time.at(REDIS.get("last_call_#{@key}").to_i)
  end

  def any?
    get.to_i != 0
  end
end