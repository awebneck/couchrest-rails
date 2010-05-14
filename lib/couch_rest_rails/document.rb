module CouchRestRails
  class Document < CouchRest::ExtendedDocument

    include ActiveModel::Validations

    def self.use_database(db)
      db = [COUCHDB_CONFIG[:db_prefix], db.to_s, COUCHDB_CONFIG[:db_suffix]].join
      self.database = COUCHDB_SERVER.database(db)
    end
    
    def self.unadorned_database_name
      database.name.sub(/^#{COUCHDB_CONFIG[:db_prefix]}/, '').sub(/#{COUCHDB_CONFIG[:db_suffix]}$/, '')
    end
    
    def to_model
      self
    end
    
    def to_key
      id
    end
    
    def persisted?
      !new?
    end
  end
end
