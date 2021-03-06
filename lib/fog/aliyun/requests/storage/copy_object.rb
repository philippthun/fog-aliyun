# frozen_string_literal: true

module Fog
  module Aliyun
    class Storage
      class Real
        # Copy object
        #
        # ==== Parameters
        # * source_bucket<~String> - Name of source bucket
        # * source_object<~String> - Name of source object
        # * target_bucket<~String> - Name of bucket to create copy in
        # * target_object<~String> - Name for new copy of object
        # * options<~Hash> - Additional headers options={}
        def copy_object(source_bucket, source_object, target_bucket, target_object, options = {})
          options = options.reject { |_key, value| value.nil? }
          bucket = options[:bucket]
          bucket ||= @aliyun_oss_bucket
          source_bucket ||= bucket
          target_bucket ||= bucket
          headers = { 'x-oss-copy-source' => "/#{source_bucket}/#{source_object}" }
          resource = target_bucket + '/' + target_object
          request(expects: [200, 203],
                  headers: headers,
                  method: 'PUT',
                  path: target_object,
                  bucket: target_bucket,
                  resource: resource,
                  location: get_bucket_location(bucket))
        end
      end
    end
  end
end
