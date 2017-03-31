function sleep(time, callback) {
  setTimeout(callback, time);
}

function sleepAsync(time) {
  return new Promise((resolve, reject) => {
    sleep(time, resolve);
  });
}

async function run() {
  console.log('running');
  await sleepAsync(3000);
  console.log('done');
}

run();
