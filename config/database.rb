# configure do
#   # Log queries to STDOUT in development
#   if Sinatra::Application.development?
#     ActiveRecord::Base.logger = Logger.new(STDOUT)
#   end

#   set :database, {
#     adapter: "sqlite3",
#     database: "db/db.sqlite3"
#   }

#   # Load all models from app/models, using autoload instead of require
#   # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
#   Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
#     filename = File.basename(model_file).gsub('.rb', '')
#     autoload ActiveSupport::Inflector.camelize(filename), model_file
#   end

# end

configure do
  # Log queries to STDOUT in development
 if Sinatra::Application.development?
  set :database, {
  adapter: "sqlite3",
  database: "db/db.sqlite3"
  }
else
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://ebpjyhrughuyxv:6a84fc3ac9374b337077a234337aea735172aa628068a2b114cc931ac5394a64@ec2-54-83-27-165.compute-1.amazonaws.com:5432/dricio82gg85q')
  set :database, {
  adapter: "postgresql",
  host: db.host,
  username: db.user,
  password: db.password,
  database: db.path[1..-1],
  encoding: "utf8"
  }

end

  # Load all models from app/models, using autoload instead of require
  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end

end