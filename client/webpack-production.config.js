const webpack = require('webpack')
const path = require('path')
const buildPath = path.resolve(__dirname, '..', 'build')
const nodeModulesPath = path.resolve(__dirname, 'node_modules')
const TransferWebpackPlugin = require('transfer-webpack-plugin')

const config = {
  entry: [path.join(__dirname, 'app/app.js')],
  resolve: {
    extensions: ["", ".js"]
  },
  devtool: 'source-map',
  output: {
    path: buildPath,
    filename: 'app.js'
  },
  plugins: [
    new webpack.optimize.UglifyJsPlugin({
      compress: {
        warnings: false
      }
    }),
    new webpack.NoErrorsPlugin(),
    new TransferWebpackPlugin([
      {from: 'www'}
    ], path.resolve(__dirname,"src"))
  ],
  module: {
    loaders: [
      {
        test: /\.js$/,
        loaders: ['babel'],
        exclude: [nodeModulesPath]
      }
    ]
  }
}

module.exports = config
