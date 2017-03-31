import { MongoClient } from 'mongodb';

let db;
MongoClient.connect('mongodb://localhost/test')
.then((_db) => {
  db = _db;
  console.log('connect', db.databaseName);

  return db.collection('groups').findOne({ name: 'baomi' });
})
.then((group) => {
  console.log('groups findOne', group);

  return db.collection('projects').find({ groupId: group._id }).toArray();
})
.then((projects) => {
  console.log('projects find', projects);

  const projectIds = projects.map((p) => p._id);
  return db.collection('users').find({ projectId: { $in: projectIds } }).toArray();
})
.then((users) => {
  console.log('users find', users);
})
.catch((err) => {
  console.log('error', err);
});
