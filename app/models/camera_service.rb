class CameraService
  attr_reader :connection

  def initialize
    uuid = "a-a6486a40-c536-0133-4d8a-12819bc4053b"
    @connection = Faraday.new("https://cameratag.com/api/v7/cameras/#{uuid}/videos.json")
  end

  def recordings
    data = parse(connection.get("?api_key=#{ENV["CAMERA_TOKEN"]}"))
    # binding.pry
    # data.map do |recording|
    #   recording[:formats].first[:video_url]
    # end
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
