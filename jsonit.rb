begin
  require 'http'
rescue LoadError
  puts "Make sure you install the http gem, from https://github.com/httprb/http.rb"
  exit
end

require 'json'
require 'pry'

payload = { log: {contents: "This is a cool log"} }

# post and create a log
log_json = JSON.parse HTTP.post('http://localhost:3000/api/logs', json: payload).to_s
log_created = log_json["log"]
raise "Log not created" unless log_created["id"].to_i > 0

# get the log 
log_json= JSON.parse HTTP.get("http://localhost:3000/api/logs/#{log_created["id"]}").to_s
log = log_json["log"]
raise "Log not found" unless log["id"].to_i > 0


logs_json = JSON.parse HTTP.get('http://localhost:3000/api/logs').to_s
found_log = logs_json["logs"].find {|l| l["id"] == log["id"] }
raise "Log not included in json" unless found_log["id"].to_i > 0

puts "If you made it this far, huzzah!"
