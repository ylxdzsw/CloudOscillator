import React from 'react'
import ReactDOM from 'react-dom'
import injectTapEventPlugin from 'react-tap-event-plugin'
import jquery from 'jquery'
import tuna from 'tunajs'
import Main from './Main'

injectTapEventPlugin()

ReactDOM.render(<Main />, document.getElementById('app'))

window.$ = jquery
window.v1 = (s, ...y) => `//localhost:3001/v1/${zip(s,y).join('')}`

const zip = (x,y) => {
    const res = []
    x = x.slice(); y = y.slice()
    while(x.length){
        res.push(x.shift())
        res.push(y.shift())
    }
    return res
}
