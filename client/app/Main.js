import React from 'react'
import {stop} from './utils.js'

class Main extends React.Component {
    constructor(props, context) {
        super(props, context)

        this.state = {}
    }

    dropHandler(e) {
        stop(e)
        if(!e.dataTransfer.files) return

        window.file = e.dataTransfer.files[0]
        const reader = new FileReader()

        $.ajax({
            url: v1`info`, method: 'POST', data: JSON.stringify({filename: file.name}),
            //processData: false, contentType: false
        }).done((data) => {
            console.log(data)
        })

    }

    render() {
        return (
            <div
                onDragEnter={stop}
                onDragOver={stop}
                onDrop={this.dropHandler}>
                Hello World
            </div>
        )
    }
}

export default Main
