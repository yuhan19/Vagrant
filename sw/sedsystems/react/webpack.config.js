const path = require('path');
const HtmlWebPackPlugin = require('html-webpack-plugin');

const  htmlPlugin = new HtmlWebPackPlugin({
  template: path.join(__dirname, './src/index.html'),
  filename: 'index.html'
});

module.exports = {
  mode: 'development',
  plugins: [
    htmlPlugin
  ],
  module: {
    rules: [
      { test: /\.js|jsx$/, use: 'babel-loader', exclude: /node_modules/}
    ]
  }
};
