require_relative '../connection'
Dir.glob("../models/*").each{|file|
    require_relative file
}

p Client.create(firstname: "Pascal", lastname: "Hurni")

iterate = 10
while iterate > 0
    firstname = p (0...8).map{(65 + rand(26)).chr}.join
    lastname = p (0...8).map{(65 + rand(26)).chr}.join
    client = Client.create(firstname: firstname, lastname: lastname)
    iterate = iterate - 1
end