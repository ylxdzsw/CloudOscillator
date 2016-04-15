import React from 'react'
import ReactDOM from 'react-dom'
import injectTapEventPlugin from 'react-tap-event-plugin'
import jquery from 'jquery'
import tuna from 'tunajs'
import Main from './Main'

injectTapEventPlugin()

ReactDOM.render(<Main />, document.getElementById('app'))

window.$ = jquery
window.v1 = (path) => `//localhost:3001/v1/${path}`
