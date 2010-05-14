require 'rails/generators'

class CouchRestRailsGenerator < Rails::Generators::Base
  def self.source_root
    File.join(File.dirname(__FILE__), 'templates')
  end
  
  def install_couch_rest_rails
    empty_directory "db/couch"
    empty_directory "test/fixtures/couch"
    template "couchdb.yml", "config/couchdb.yml"
    template "couchdb_initializer.rb", "config/initializers/couchdb.rb"
  end
end
