require "httparty"
require "json"

puts "Create teams"

def headers
  {
    "x-rapidapi-key" => "22f928be6fmsh961dfaf77a085e7p1b48d2jsna83e0330f30a",
    "x-rapidapi-host" => "english-premiere-league1.p.rapidapi.com",
    "Content-Type" => "application/json"
  }
end

def querystring
  {
    "limit": "20"
  }
end

url = "https://english-premiere-league1.p.rapidapi.com/team/list"
response = HTTParty.get(url, headers: headers, params: querystring)

if response.success?
  response_data = JSON.parse(response.body, symbolize_names: true)
  response_data.each do |team|
    name = team[:shortDisplayName]
    logo = team[:logos][0]
    puts "#{name} - #{logo}"
    Team.create!(en_name: name, logo: logo)
  end
end

puts "Done"
