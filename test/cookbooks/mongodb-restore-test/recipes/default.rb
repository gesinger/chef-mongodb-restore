include_recipe 'mongodb::10gen_repo'
include_recipe 'mongodb::default'

export_file_name = 'mongo_dump.bson'
cookbook_file export_file_name do
  path "/tmp/#{export_file_name}"
  action :create_if_missing
end

include_recipe 'mongodb-restore::default'
