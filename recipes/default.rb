# Cookbook Name:: mongodb-restore
# Recipe:: default

host          = node[:mongodb_restore][:host]
port          = node[:mongodb_restore][:port]
db            = node[:mongodb_restore][:db]
dbpath        = node[:mongodb_restore][:dbpath]
collection    = node[:mongodb_restore][:collection]
file          = node[:mongodb_restore][:file]
use_journal   = node[:mongodb_restore][:use_journal]
ignore_blanks = node[:mongodb_restore][:ignore_blanks]
tail          = node[:mongodb_restore][:tail]

restore_script = "mongorestore"
if host
  restore_script += " --host #{host}"
end
if port
  restore_script += " --port #{port}"
end
if db
   restore_script += " --db #{db}"
end
if dbpath
   restore_script += " --dbpath #{dbpath}"
end
if collection
   restore_script += " --collection #{collection}"
end
if use_journal
   restore_script += " --journal"
end
if ignore_blanks
   restore_script += " --ignoreBlanks"
end

if tail
  restore_script += " #{tail}"
end

restore_script += " #{file}"

execute "run restore script" do
  command restore_script
end
