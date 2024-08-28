require "socket"

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  
  http_method, path_and_params, http_version = request_line.split
  path, params = path_and_params.split('?')
  params = (params || '').split('&')
  params = params.map { |pair| pair.split('=') }.to_h
  
  client.puts request_line
  client.puts http_method
  client.puts path
  client.puts params
  client.puts http_version

  rolls = params["rolls"].to_i
  sides = params["sides"].to_i

  rolls.times do
    roll = rand(sides) + 1
    client.puts roll
  end

  client.close
end
