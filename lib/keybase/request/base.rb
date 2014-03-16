module Keybase
  module Request
    API_BASE_URL = 'https://keybase.io'
    class Base

      def self.get(url, params={})
        Keybase::Response.new(conn.get(url, params)).body
      end
      
      private
      
      def self.conn
        @@conn ||= Faraday.new(:url => API_BASE_URL) do |faraday|
          faraday.path_prefix = "/_/api/1.0"
          faraday.request  :url_encoded
          # faraday.response :logger
          faraday.adapter  Faraday.default_adapter
        end
      end
      
    end
  end
end
