/*
    QMLNyanCat
    (C) 2012 Juha Turunen (turunen@iki.fi)
    You are free to do whatever you want with the code.
*/

import QtQuick 1.0

Column {
    id: starField
    anchors.fill: parent
    anchors.topMargin: 6* pixelDim
    spacing: 6 * pixelDim
    Repeater {
        model: phaseModel
        delegate: pop
    }

    Component {
        id: pop
        Image {
            source: "data/pop" + (((frame + phase) % 6) + 1) + ".png"
            width: sourceSize.width * pixelDim
            height: sourceSize.height * pixelDim
            smooth: false
            x: starField.width - ((frame + phase) % 12) * pixelDim * 7

        }
    }

    // Random sometimes looks crap
    ListModel {
        id: phaseModel
        ListElement { phase: 0 }
        ListElement { phase: 6 }
        ListElement { phase: 2 }
        ListElement { phase: 7 }
        ListElement { phase: 11 }
        ListElement { phase: 3 }
    }
}



