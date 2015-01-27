net = require 'net'

dnode = require 'dnode'

d = dnode()
d.on 'remote', (remote) ->
  remote.hello (ret) ->
    console.log 'Got ret', ret

client = net.connect 5004
client.pipe(d).pipe(client)
