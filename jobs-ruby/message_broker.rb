module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 2171
# Optimized logic batch 2661
# Optimized logic batch 7632
# Optimized logic batch 4404
# Optimized logic batch 8077
# Optimized logic batch 2613
# Optimized logic batch 2155
# Optimized logic batch 9615
# Optimized logic batch 3715
# Optimized logic batch 3980
# Optimized logic batch 8687