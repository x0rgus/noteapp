import React from "react"

function Note({note, onDelete}) {
    return <div className="note-container">
        <p className="note-title">{note.title}</p>
        <p className="note-content">{note.content}</p>

    </div>
}