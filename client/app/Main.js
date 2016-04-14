import React from 'react'

class Main extends React.Component {
    constructor(props, context) {
        super(props, context)

        this.state = {}
    }

    play() {
        const fuck = new Wad({source: '//localhost:3001/v1/files/0'})
        fuck.play({env: fuck.env})
    }

    render() {
        return (
            <div onClick={this.play}>
                Hello World
            </div>
        )
    }
}

export default Main
