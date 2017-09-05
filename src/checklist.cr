require "./checklist/*"
require "kemal"
require "mongo"
Mc = Mongo::Client.new "mongodb://127.0.0.1:27017"
Db = Mc["jihantoro_checklist"]
Col = Db["checklist"]
a = {
	"url" => "ayam",
	"email" => "jihantoro8@gmail.com",
	"data" => [    	{
    		"id"=> 23,
    		"title" => "Deploy The App",
    		"description" => "Deploy on ubuntu 17.04 Nancy, with Docker",
    		"class"=> "done"
    	},
    	{
    		"id"=> 24,
    		"title" => "Use Mongo Debeh",
    		"description" => "Mongodebeh for high RAM COnsumption",
    		"class"=> ""
    	}]
}
#Col.insert(a)

get "/" do |env|
	_for = env.params.query["for"]
	if _for.empty?

	else

	end
end

get "/api" do |env|
	env.response.headers.add("Access-Control-Allow-Origin", "*")
	env.response.content_type = "application/json"
	_for = env.params.query["for"]
	if _for.empty?

	else
		a = Col.find_one({"url" => _for})
		v = a
		v
	end
end

Kemal.run