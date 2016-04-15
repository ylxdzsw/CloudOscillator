import React from 'react'
import ReactDOM from 'react-dom'
import injectTapEventPlugin from 'react-tap-event-plugin'
import Wad from 'web-audio-daw'
import jquery from 'jquery'
import Main from './Main'

injectTapEventPlugin()

ReactDOM.render(<Main />, document.getElementById('app'))

window.Wad = Wad
window.$ = jquery
