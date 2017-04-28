require "json"
require "net/https"
require "uri"

class BigFiveResultsPoster
  attr_reader :token, :response_code

  def initialize(results_hash)
    @json_payload = JSON.generate(results_hash)
  end

  def post
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, json_header)
    request.body = json_payload
    http.use_ssl = true
    # Little bit risky...
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    response = http.request(request)
    @response_code = response.code
    @token = response.body
    return true if @response_code == "201"
    false
  end

  private

  def uri
   @uri ||= URI.parse(
    "https://recruitbot.trikeapps.com/api/v1/roles/mid-senior-web-developer/"\
    "big_five_profile_submissions"
    )
  end

  def json_header
    { 'Content-Type': 'application/json' }
  end

  attr_reader :json_payload
end
