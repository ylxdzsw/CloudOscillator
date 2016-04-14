import React from 'react'
import ReactDOM from 'react-dom'
import injectTapEventPlugin from 'react-tap-event-plugin'
import Main from './Main'
import Wad from 'web-audio-daw'

injectTapEventPlugin()

ReactDOM.render(<Main />, document.getElementById('app'))

window.Wad = Wad
