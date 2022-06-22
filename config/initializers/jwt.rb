
require 'json_web_token'

module JWT
  include JWT::DefaultOptions

  module_function

  def encode(payload, key, algorithm = 'HS256', header_fields = {})
    Encode.new(payload: payload,
               key: key,
               algorithm: algorithm,
               headers: header_fields).segments
  end

  def decode(jwt, key = nil, verify = true, options = {}, &keyfinder) # rubocop:disable Style/OptionalBooleanParameter
    Decode.new(jwt, key, verify, DEFAULT_OPTIONS.merge(options), &keyfinder).decode_segments
  end
end
