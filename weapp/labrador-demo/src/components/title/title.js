import wx, { Component, PropTypes } from 'labrador';

export default class Title extends Component {
  static propTypes = {
    value: PropTypes.string
  }

  _onTap = () => {
    console.log('title _onTap');
  }
}
