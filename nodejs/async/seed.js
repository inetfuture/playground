db.groups.insert({ _id: 1, name: 'engineer' });
db.projects.insert({ _id: 1, groupId: 1, name: 'server' });
db.users.insert({ _id: 1, projectId: 1, name: 'aaron' });
