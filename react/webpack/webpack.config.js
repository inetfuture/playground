var webpack = require('webpack');
var merge = require('webpack-merge');
var path = require('path');
var HtmlwebpackPlugin = require('html-webpack-plugin');

var TARGET = process.env.npm_lifecycle_event;
var ROOT_PATH = path.resolve(__dirname);
var APP_PATH = path.resolve(ROOT_PATH, 'app');

var common = {
  entry: APP_PATH,
  module: {
    loaders: [{
      test: /\.css$/,
      loaders: ['style', 'css'],
      include: APP_PATH
    }]
  },
  plugins: [
    new HtmlwebpackPlugin({
      title: 'Kanban app'
    })
  ]
};

if (TARGET === 'start' || !TARGET) {
  module.exports = merge(common, {
    devtool: 'eval-source-map',
    devServer: {
      historyApiFallback: true,
      hot: true,
      inline: true,
      progress: true,
      quiet: true,
      host: process.env.HOST,
      port: process.env.PORT
    },
    plugins: [
      new webpack.HotModuleReplacementPlugin(),
    ]
  });
}


