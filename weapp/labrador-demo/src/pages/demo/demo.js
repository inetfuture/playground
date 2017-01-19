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
          value: this.state.title
        }
      }
    };
  }

  onLoad = () => {
    console.log('onLoad...');
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
}
