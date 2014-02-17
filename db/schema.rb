DB = Sequel.sqlite

DB.create_table :users do
  primary_key :id
  varchar :login
  varchar :password
  varchar :subscription, default: nil
end

DB.create_table :articles do
  primary_key :id
  varchar :title
  varchar :content
end
