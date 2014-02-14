DB = Sequel.sqlite

DB.create_table :users do
  primary_key :id
  varchar :login
  varchar :password
  boolean :subscribed, default: false
end

DB.create_table :articles do
  primary_key :id
  varchar :title
  varchar :content
end
