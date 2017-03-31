import { MongoClient } from 'mongodb';

async function run() {
  try {
    const db = await MongoClient.connect('mongodb://localhost/test');
    const [groups, projects, users] = await Promise.all([
      db.collection('groups').find().toArray(),
      db.collection('projects').find().toArray(),
      db.collection('users').find().toArray()
    ]);
    console.log('done', { groups, projects, users });
  } catch (err) {
    console.log('error', err);
  }
}

run();
