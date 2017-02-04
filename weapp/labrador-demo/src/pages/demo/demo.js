import wx, { Component } from 'labrador';

import Title from '../../components/title/title';

export default class Demo extends Component {
  state = {
    title: 'Hello World'
  }

  children = () => {
    return {
      title: {
        component: Title,
        props: {
          value: this.state.title,
          a: this.state.a,
          b: this.state.b
        }
      }
    };
  }

  onLoad = () => {
    console.log('onLoad...');
    this.setState({ a: 1, b: 2 });
    this.setState({ showCat: true });
  }

  onReady = () => {
    console.log('onReady...');
    this.setState({ options: ['a', 'b', 'c'] });
  }

  _onChangePicker = (e) => {
    console.log(e);
    this.setState({ optionsIndex: e.detail.value });
    console.log(this);
    this.setState({ title: this.state.options[e.detail.value] });
  }

  _onTapOptionItem = (e) => {
    console.log('_onTapOptionItem', e);
  }

  _onTap = () => {
    console.log('demo _onTap');
  }
}
