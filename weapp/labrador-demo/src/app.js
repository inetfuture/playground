import request from 'al-request';
import { setStore } from 'labrador-redux';
import { sleep } from './utils/utils';
import store from './redux';

console.log('global & window', global, window);

if (__DEV__) {
  console.log('当前为开发环境');
}

// 向labrador-redux注册store
setStore(store);

export default class {
  async onLaunch() {

  }
}
