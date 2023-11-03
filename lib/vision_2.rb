# require "base64"
# 2 require "json"
# 3 require "net/https"

# 4 module Vision
# 5  class << self
# 6    def image_analysis(image_file)

# 7      api_url = "https://vision.googleapis.com/v1/images:annotate?key=#{ENV["GOOGLE_API_KEY"]}"

# 8      base64_image = Base64.encode64(image_file.tempfile.read)

# 9      params = {
# 10        requests: [{
# 11          image: {
# 12            content: base64_image
# 13          },
# 14          features: [
# 15            {
# 16              type: "SAFE_SEARCH_DETECTION"
# 17            }
# 18          ]
# 19        }]
# 20      }.to_json

# 21      uri = URI.parse(api_url)
# 22      https = Net::HTTP.new(uri.host, uri.port)
# 23      https.use_ssl = true
# 24     request = Net::HTTP::Post.new(uri.request_uri)
# 25      request["Content-Type"] = "application/json"
# 26      response = https.request(request, params)
# 27      result = JSON.parse(response.body)

# 28      if (error = result["responses"][0]["error"]).present?
# 29        raise error["message"]
# 30      elsif
# 31        result_arr = result["responses"].flatten.map do |parsed_image|
# 32          parsed_image["safeSearchAnnotation"].values
# 33        end.flatten
# 34          if result_arr.include?("POSSIBLE") || result_arr.include?("LIKELY") || result_arr.include?("VERY_LIKELY")
# 35            false
# 36          else
# 37            true
# 38          end
# 39      end
# 40    end
# 41  end
# 42 end