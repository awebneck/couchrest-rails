require 'couch_rest_rails'

%w(yajl/json_gem couchrest).each do |g|
  begin
    require g
  rescue LoadError
    puts "Could not load required gem '#{g}'" 
    exit
  end
end