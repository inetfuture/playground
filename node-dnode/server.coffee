net = require 'net'

dnode = require 'dnode'

# server = net.createServer (client) ->
#   d = dnode
#     hello: (cb) ->
#       cb 'world'

#   client.pipe(d).pipe(client)

server = dnode
  hello: (cb) ->
    cb 'world'

console.log server.cons.toString()
console.log server.cons()

server.listen 5004
