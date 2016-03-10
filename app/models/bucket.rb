require 'aws-sdk'

class Bucket
  attr_reader :bucket

  def initialize
    access_key = ENV["AWS_ACCESS_KEY_ID"]
    secret_access_key = ENV["AWS_SECRET_ACCESS_KEY"]
    s3 = AWS::S3.new(access_key_id: access_key, secret_access_key: secret_access_key)
    @bucket = s3.buckets[ENV["S3_BUCKET_NAME"]]
  end

  def get_aws_photos
    photos = Hash.new
    bucket.objects.map do |object|
      photos[object.key.split('/').last] = object.key
    end
    photos
  end

end
