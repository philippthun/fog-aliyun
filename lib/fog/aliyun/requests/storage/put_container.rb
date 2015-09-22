module Fog
  module Storage
    class Alilyun
      class Real
        # Create a new container
        #
        # ==== Parameters
        # * name<~String> - Name for container, ����·������β����Я��'/'
        #
        def put_container(name, options={})
          bucket = options[:bucket]
          bucket ||= @aliyun_oss_bucket
          location = get_bucket_location(bucket)
          endpoint = "http://"+location+".aliyuncs.com"

          path = name+'/'
          resource = bucket+'/'+name+'/'
          request(
              :expects  => [200, 203],
              :method   => 'PUT',
              :path     => path,
              :bucket   => bucket,
              :resource => resource,
              :endpoint => endpoint
          )
        end
      end
      
      class Mock
        def put_container(name, options={})

        end
      end
    end
  end
end