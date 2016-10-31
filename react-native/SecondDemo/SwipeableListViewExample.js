/**
 * Copyright (c) 2013-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *
 * The examples provided by Facebook are for non-commercial testing and
 * evaluation purposes only.
 *
 * Facebook reserves all rights not expressly granted.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL
 * FACEBOOK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * @flow
 */
'use strict';

import React, { Component } from 'react';
import {
  Image,
  SwipeableListView,
  TouchableHighlight,
  StyleSheet,
  RecyclerViewBackedScrollView,
  Text,
  View,
  ScrollView,
  Alert,
} from 'react-native';

export default class SwipeableListViewSimpleExample extends Component {
  constructor(props) {
    super(props);

    let ds = SwipeableListView.getNewDataSource();
    this.state = {
      dataSource: ds.cloneWithRowsAndSections(...this._genDataSource({})),
    };
    this.time = 'haha';
    setInterval(() => {
      this.time = 'haha' + Date.now();
      console.log(this.ref, this.ref.forceUpdate);
      this.ref.forceUpdate();
    }, 5000);
  }

  render = function() {
    return (
      <ScrollView>
        <Text  ref={(ref) => this.ref = ref} style={{marginTop: 60, height: 60}}>{this.time}</Text>
        <SwipeableListView
          dataSource={this.state.dataSource}
          maxSwipeDistance={100}
          renderQuickActions={
            (rowData, sectionID, rowID) => {
              return (<View style={styles.actionsContainer}>
                <TouchableHighlight onPress={() => {
                  Alert.alert('Tips', 'You could do something with this row: ' + rowData.text);
                }}>
                  <Text>Remove</Text>
                </TouchableHighlight>
              </View>);
          }}
          renderRow={this._renderRow}
          renderScrollComponent={props => <RecyclerViewBackedScrollView {...props} />}
          renderSeparator={this._renderSeperator}
        />
      </ScrollView>
    );
  }

  _renderRow = function(rowData, sectionID, rowID, highlightRow) {
    let rowHash = Math.abs(hashCode(rowData.id));
    return (
      <TouchableHighlight onPress={() => {}}>
        <View>
          <View style={styles.row}>
            <Text style={styles.text}>
              {rowData.id + ' - ' + LOREM_IPSUM.substr(0, rowHash % 301 + 10)}
            </Text>
          </View>
        </View>
      </TouchableHighlight>
    );
  }

  _genDataSource = function(pressData) {
    let dataBlob = {};
    let sectionIDs = ['Section 0'];
    let rowIDs = [[]];
    /**
     * dataBlob example below:
      {
        'Section 0': {
          'Row 0': {
            id: '0',
            text: 'row 0 text'
          },
          'Row 1': {
            id: '1',
            text: 'row 1 text'
          }
        }
      }
    */
    // only one section in this example
    dataBlob['Section 0'] = {};
    for (let ii = 0; ii < 100; ii++) {
      let pressedText = pressData[ii] ? ' (pressed)' : '';
      dataBlob[sectionIDs[0]]['Row ' + ii] = {id: 'Row ' + ii, text: 'Row ' + ii + pressedText};
      rowIDs[0].push('Row ' + ii);
    }
    return [dataBlob, sectionIDs, rowIDs];
  }

  _renderSeperator = function(sectionID, rowID, adjacentRowHighlighted) {
    return (
      <View
        key={`${sectionID}-${rowID}`}
        style={{
          height: adjacentRowHighlighted ? 4 : 1,
          backgroundColor: adjacentRowHighlighted ? '#3B5998' : '#CCCCCC',
        }}
      />
    );
  }
}

let LOREM_IPSUM = 'Lorem ipsum dolor sit amet, ius ad pertinax oportere accommodare, an vix civibus corrumpit referrentur. Te nam case ludus inciderint, te mea facilisi adipiscing. Sea id integre luptatum. In tota sale consequuntur nec. Erat ocurreret mei ei. Eu paulo sapientem vulputate est, vel an accusam intellegam interesset. Nam eu stet pericula reprimique, ea vim illud modus, putant invidunt reprehendunt ne qui.';

/* eslint no-bitwise: 0 */
let hashCode = function(str) {
  let hash = 15;
  for (let ii = str.length - 1; ii >= 0; ii--) {
    hash = ((hash << 5) - hash) + str.charCodeAt(ii);
  }
  return hash;
};

let styles = StyleSheet.create({
  row: {
    flexDirection: 'row',
    justifyContent: 'center',
    padding: 10,
    backgroundColor: '#F6F6F6',
  },
  thumb: {
    width: 64,
    height: 64,
  },
  text: {
    flex: 1,
  },
  actionsContainer: {
    flex: 1,
    flexDirection: 'row',
    justifyContent: 'flex-end',
    alignItems: 'center',
  },
});
