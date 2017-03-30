import { MongoClient } from 'mongodb';

async function run() {
  try {
    const db = await MongoClient.connect('mongodb://localhost/test');
    const group = await db.collection('groups').findOne({ name: 'baomi' });
    const projects = await db.collection('projects').find({ groupId: group._id }).toArray();
    const projectIds = projects.map((p) => p._id);
    const users = await db.collection('users').find({ projectId: { $in: projectIds } }).toArray();
    console.log('done', users);
  } catch (err) {
    console.log('error', err);
  }
}

run();
