import { MongoClient } from 'mongodb';

let db;
MongoClient.connect('mongodb://localhost/test')
.then(function (_db) {
  db = _db;
  console.log('connect', db.databaseName);

  return db.collection('groups').findOne({ name: 'baomi' });
})
.then(function (group) {
  console.log('groups findOne', group);

  return db.collection('projects').find({ groupId: group._id }).toArray();
})
.then(function (projects) {
  console.log('projects find', projects);

  const projectIds = projects.map((p) => p._id);
  return db.collection('users').find({ projectId: { $in: projectIds } }).toArray();
})
.then(function (users) {
  console.log('users find', users);
})
.catch(function (err) {
  console.log('error', err);
});
