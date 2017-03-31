// doA(), doB() here are asynchronous functions which returns promise

// Didn't use async/await when SHOULD
await doA()
.then(() => {
  doB()
});

// Used async/await when SHOULD NOT
conat items = ['whatever'];
await items.filter(() => { items === 'whatever' });

// Forgot await to guarantee success,
// assume doB() should only be called after doA() succeeded
doA()
const result = await doB()

