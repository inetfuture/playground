mongodb = require 'mongodb'

mongodb.MongoClient.connect 'mongodb://localhost/test', (err, db) ->
  throw err if err
  doc = { items: (new mongodb.ObjectID() for i in [0...840999]) }
  db.collection('howManyObjectIdsCanOneDocContainAtMost').insert doc, (err, doc) ->
    throw err if err
    console.log 'done'
    process.exit 0

# Result: around 840k
