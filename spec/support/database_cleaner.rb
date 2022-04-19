# frozen_string_literal: true

require 'database_cleaner'
require 'database_cleaner-active_record'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.after(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)

    delete_all_s3_object
  end
end

def delete_all_s3_object
  s3 = Aws::S3::Client.new(access_key_id: ENV['USER_ACCESS_KEY_ID'],
                           secret_access_key: ENV['USER_SECRET_ACCESS_KEY'], region: 'ap-southeast-1')
  resp = s3.list_objects(bucket: 'divisionly-api-test')
  if resp.present?
    resp.contents.each do |object|
      delete_resp = s3.delete_object({
                                       bucket: 'divisionly-api-test',
                                       key: object.key
                                     })
      puts "delete_resp = #{delete_resp}"
    end
  end
end
