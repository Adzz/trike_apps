require "json"
require "net/http"
require "uri"

class BigFiveResultsPoster
  attr_reader :token, :response_code,

  def intialize(results_hash)
    @json_payload = JSON.generate(results_hash)
    @token = "123"
    @response_code = "200"
  end

  def post
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, json_header)
    request.body = json_payload
    http.request(request)
  end

  private

  def uri
   @uri ||= URI.parse(
    "https://recruitbot.trikeapps.com/api/v1/roles/mid-senior-web-developer/"\
    "big_five_profile_submissions"
    )
  end

  def json_header
    { 'Content-Type': 'text/json' }
  end

  attr_reader :json_payload
end
