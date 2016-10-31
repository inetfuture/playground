import React, { Component } from 'react';
import { ScrollView, View, KeyboardAvoidingView, TextInput, StyleSheet, Text } from 'react-native';
import KeyboardSpacer from 'react-native-keyboard-spacer';
import { KeyboardAwareScrollView } from 'react-native-keyboard-aware-scroll-view'
import SmartScrollView from 'react-native-smart-scroll-view';

export default class Keyboard extends Component {
  render = () => {
    return (
      <SmartScrollView style={styles.scrollView}>
        <Text>
          Welcome to the developer documentation for gRPC. Here you can learn about key gRPC concepts, find quick starts, reference material, and tutorials for all our supported languages, and more. If you’re new to gRPC we recommend that you read What is gRPC? to find out more about our system and how it works. Or, if you want to see gRPC in action first, visit the QuickStart for your favourite language.
          Welcome to the developer documentation for gRPC. Here you can learn about key gRPC concepts, find quick starts, reference material, and tutorials for all our supported languages, and more. If you’re new to gRPC we recommend that you read What is gRPC? to find out more about our system and how it works. Or, if you want to see gRPC in action first, visit the QuickStart for your favourite language.
          Welcome to the developer documentation for gRPC. Here you can learn about key gRPC concepts, find quick starts, reference material, and tutorials for all our supported languages, and more. If you’re new to gRPC we recommend that you read What is gRPC? to find out more about our system and how it works. Or, if you want to see gRPC in action first, visit the QuickStart for your favourite language.
          Welcome to the developer documentation for gRPC. Here you can learn about key gRPC concepts, find quick starts, reference material, and tutorials for all our supported languages, and more. If you’re new to gRPC we recommend that you read What is gRPC? to find out more about our system and how it works. Or, if you want to see gRPC in action first, visit the QuickStart for your favourite language.
          Welcome to the developer documentation for gRPC. Here you can learn about key gRPC concepts, find quick starts, reference material, and tutorials for all our supported languages, and more. If you’re new to gRPC we recommend that you read What is gRPC? to find out more about our system and how it works. Or, if you want to see gRPC in action first, visit the QuickStart for your favourite language.
          Welcome to the developer documentation for gRPC. Here you can learn about key gRPC concepts, find quick starts, reference material, and tutorials for all our supported languages, and more. If you’re new to gRPC we recommend that you read What is gRPC? to find out more about our system and how it works. Or, if you want to see gRPC in action first, visit the QuickStart for your favourite language.
        </Text>
        <TextInput style={styles.textInput} placeholder="TextInput 1" smartScrollOptions={{type:'text',moveToNext:true}} />
        <TextInput style={styles.textInput} placeholder="TextInput 2" smartScrollOptions={{type:'text',moveToNext:true}} />
        <TextInput style={styles.textInput} placeholder="TextInput 3" smartScrollOptions={{type:'text',moveToNext:true}} />
        <Text>
          Welcome to the developer documentation for gRPC. Here you can learn about key gRPC concepts, find quick starts, reference material, and tutorials for all our supported languages, and more. If you’re new to gRPC we recommend that you read What is gRPC? to find out more about our system and how it works. Or, if you want to see gRPC in action first, visit the QuickStart for your favourite language.
          Welcome to the developer documentation for gRPC. Here you can learn about key gRPC concepts, find quick starts, reference material, and tutorials for all our supported languages, and more. If you’re new to gRPC we recommend that you read What is gRPC? to find out more about our system and how it works. Or, if you want to see gRPC in action first, visit the QuickStart for your favourite language.
          Welcome to the developer documentation for gRPC. Here you can learn about key gRPC concepts, find quick starts, reference material, and tutorials for all our supported languages, and more. If you’re new to gRPC we recommend that you read What is gRPC? to find out more about our system and how it works. Or, if you want to see gRPC in action first, visit the QuickStart for your favourite language.
          Welcome to the developer documentation for gRPC. Here you can learn about key gRPC concepts, find quick starts, reference material, and tutorials for all our supported languages, and more. If you’re new to gRPC we recommend that you read What is gRPC? to find out more about our system and how it works. Or, if you want to see gRPC in action first, visit the QuickStart for your favourite language.
          Welcome to the developer documentation for gRPC. Here you can learn about key gRPC concepts, find quick starts, reference material, and tutorials for all our supported languages, and more. If you’re new to gRPC we recommend that you read What is gRPC? to find out more about our system and how it works. Or, if you want to see gRPC in action first, visit the QuickStart for your favourite language.
          Welcome to the developer documentation for gRPC. Here you can learn about key gRPC concepts, find quick starts, reference material, and tutorials for all our supported languages, and more. If you’re new to gRPC we recommend that you read What is gRPC? to find out more about our system and how it works. Or, if you want to see gRPC in action first, visit the QuickStart for your favourite language.
        </Text>
        <TextInput style={styles.textInput} placeholder="TextInput 1" smartScrollOptions={{type:'text',moveToNext:true}} />
        <TextInput style={styles.textInput} placeholder="TextInput 2" smartScrollOptions={{type:'text',moveToNext:true}} />
        <TextInput style={styles.textInput} placeholder="TextInput 3" smartScrollOptions={{type:'text',moveToNext:true}} />
      </SmartScrollView>
    );
  }
}

const styles = StyleSheet.create({
  scrollView: {
    // marginTop: 20,
    flex: 1,
  },
  textInput: {
    height: 40,
    padding: 10,
    borderWidth: 1,
  }
});
