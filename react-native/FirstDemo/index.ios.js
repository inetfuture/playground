/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  Animated,
  Navigator,
  TouchableHighlight
} from 'react-native';

import MapView from './MapView';
import RectangularView from './RectangularView';

class FirstDemo extends Component {
  render() {
    return (
      <Navigator
        initialRoute={{name: 'home'}}
        renderScene={(route, navigator) => {
          let SceneComponent;

          switch (route.name) {
            case 'animation':
              return <Animation navigator={navigator} />;
            default:
              return <Home navigator={navigator} />;
          }
        }}
      />
    );
  }
}

class Home extends Component {
  render() {
    return (
      <View style={homeStyles.container}>
        <Text style={homeStyles.welcome}>
          Welcome to React Native!!!
        </Text>
        <Text style={homeStyles.instructions}>
          To get started, edit index.ios.js
        </Text>
        <Text style={homeStyles.instructions}>
          Press Cmd+R to reload,{'\n'}
          Cmd+D or shake for dev menu
        </Text>

        <MapView style={{width: 200, height: 100}} />

        <RectangularView style={{width: 200, height: 100}} />

        <TouchableHighlight
          style={{margin: 10, padding: 10, backgroundColor: 'green'}}
          onPress={() => {
            this.props.navigator.push({name: 'animation'});
          }}
        >
          <Text style={{color: 'white'}}>
            Go To Animation
          </Text>
        </TouchableHighlight>
      </View>
    )
  }
}

const homeStyles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

class Animation extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      bounceValue: new Animated.Value(0),
    };
  }

  render() {
    return (
      <View style={{flex: 1}}>
        <Animated.Image                         // Base: Image, Text, View
          source={{uri: 'http://i.imgur.com/XMKOH81.jpg'}}
          style={{
            flex: 1,
            transform: [                        // `transform` is an ordered array
              {scale: this.state.bounceValue},  // Map `bounceValue` to `scale`
            ]
          }}
        />

        <TouchableHighlight
          style={{margin: 10, padding: 10, backgroundColor: 'red'}}
          onPress={this.props.navigator.pop}
        >
          <Text style={{color: 'white'}}>
            Back
          </Text>
        </TouchableHighlight>
      </View>
    );
  }

  componentDidMount() {
    this.state.bounceValue.setValue(1.5);     // Start large
    Animated.spring(                          // Base: spring, decay, timing
      this.state.bounceValue,                 // Animate `bounceValue`
      {
        toValue: 0.8,                         // Animate to smaller size
        friction: 1,                          // Bouncier spring
      }
    ).start();                                // Start the animation
  }
}

AppRegistry.registerComponent('FirstDemo', () => FirstDemo);
