import { MongoClient } from 'mongodb';

MongoClient.connect('mongodb://localhost/test', function (err, db) {
  console.log('connect', err, db.databaseName);

  db.collection('groups').findOne({ name: 'baomi' }, function (err, group) {
    console.log('groups findOne', err, group);

    db.collection('projects').find({ groupId: group._id }).toArray(function (err, projects) {
      console.log('projects find', err, projects);

      const projectIds = projects.map((p) => p._id);
      db.collection('users').find({ projectId: { $in: projectIds } }).toArray(function (err, users) {
        console.log('users find', err, users);
      });
    });
  });
});
