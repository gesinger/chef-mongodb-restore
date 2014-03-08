### chef-mongodb-restore

A Chef cookbook for restoring a mongodb database

### Usage

Add to your Berksfile or Cheffile:

```ruby
  cookbook 'mongodb-restore', :git => 'git://github.com/gesinger/chef-mongodb-restore.git'
```

Specify the attributes you want to use, and the mongodb-restore::default recipe
in your run list (this example uses the vagrant synced folder):

```json
  "mongodb_restore": {
    "db": "mydb",
    "collection": "mycollection",
    "file": "/vagrant/files/mongo_dump.bson"
  },
  "run_list": [
    "recipe[mongodb-restore::default]"
  ]
```

### Attributes

See full documentation for mongorestore for all available parameters.

* `mongodb_restore[:file]` - The location of the file to restore on the remote host
* `mongodb_restore[:db]` - The mongodb database name
* `mongodb_restore[:collection]` - The mongodb collection name
* `mongodb_restore[:host]`
* `mongodb_restore[:port]`
* `mongodb_restore[:dbpath]`
* `mongodb_restore[:use_journal]`
* `mongodb_restore[:tail]` - Any additional parameters you want to pass to mongorestore

### Building and Testing

mongodb-restore uses an internal cookbook for testing called mongodb-restore-test.
This does some file copying and external cookbook running in order to properly
test that the data was restored.

In order to test everything yourself:

* Check out the repo
* Run `bundle install`
* Run `berks install`
* Run `kitchen test`
