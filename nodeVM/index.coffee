vm = require 'vm'
util = require 'util'

users =
  store:
    aaron:
      gender: 'male'
  find: (name) ->
    users.store[name]
sandbox =
  users: users
sandbox = vm.createContext sandbox

code = """
  users.find('aaron').gender = 'female';
  users;
"""
ret = vm.runInContext code, sandbox
console.log util.inspect(sandbox, { depth: 10 }), util.inspect(ret, { depth: 10 })

users.find('aaron').gender = 'haha';
code = """
  users;
"""
ret = vm.runInContext code, sandbox
console.log util.inspect(sandbox, { depth: 10 }), util.inspect(ret, { depth: 10 })

sandbox.require = require
code = """
  Promise = require("bluebird");
  Promise.delay(3000);
"""
ret = vm.runInContext code, sandbox
console.log ret
ret.then ->
  console.log 'deplay timeout'
