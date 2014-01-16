/*
    QMLNyanCat
    (C) 2012 Juha Turunen (turunen@iki.fi)
    You are free to do whatever you want with the code.
*/

import QtQuick 2.0

Rectangle {
    property bool audio : true
    property real fps : 15
    property int frame : 0


    property bool running : true
    property int pixelDim : 6

    // Isolate audio to a separate file so that missing MultimediaKit doesn't
    // kill the whole thing
    Loader {
        source: audio ? "NyanSong.qml" : ""
    }

    color: "#003366"

    Timer {
        id: timer
        repeat: true
        interval: 1000 / fps
        onTriggered: { frame += 1 }
        running: parent.running
    }

    // Rainbow
    Row {
        anchors.right: cat.left
        anchors.rightMargin: -3 * pixelDim
        anchors.verticalCenter: cat.verticalCenter
        property bool phase : (frame % 4 > 1)
        RainbowBlock { y: parent.phase ? pixelDim : 0 }
        RainbowBlock { y: parent.phase ? 0 : pixelDim }
        RainbowBlock { y: parent.phase ? pixelDim : 0 }
        RainbowBlock { y: parent.phase ? 0 : pixelDim }
    }

    StarField {
        anchors.fill: parent
    }

    NyanCat {
        id: cat
        anchors.centerIn: parent
        Component.onCompleted: { console.log(width + "," + height) }
    }
}

