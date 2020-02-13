require_relative 'connection'
Dir.glob("models/*").each{|file|
    require_relative file
}

p Client.all