/*
    QMLNyanCat
    (C) 2012 Juha Turunen (turunen@iki.fi)
    You are free to do whatever you want with the code.
*/

import QtQuick 1.0

Item {
    width: body.width
    height: body.height

    Image {
        id: tail
        source: "data/tail" + ((frame % 12) + 1) + ".png"
        anchors.right: body.left
        anchors.bottom: body.bottom
        smooth: false
        width: sourceSize.width * pixelDim
        height: sourceSize.height * pixelDim
    }

    Image {
        id: legs
        source: "data/legs" + ((frame % 12) + 1) + ".png"
        anchors.left: body.left
        anchors.leftMargin: -4 * pixelDim
        anchors.topMargin: -2 * pixelDim
        anchors.top: body.bottom
        smooth: false
        width: sourceSize.width * pixelDim
        height: sourceSize.height * pixelDim
    }

    Image {
        id: body
        source: "data/body.png"
        width: sourceSize.width * pixelDim
        height: sourceSize.height * pixelDim
        smooth: false
        anchors.centerIn: parent
        anchors.verticalCenterOffset: frame % 6 > 2 ? pixelDim : 0
    }

    Image {
        id: head
        source: "data/head.png"
        width: sourceSize.width * pixelDim
        height: sourceSize.height * pixelDim
        smooth: false
        anchors.bottom: body.bottom
        anchors.right: body.right
        anchors.bottomMargin: ((frame % 6) == 5) ? pixelDim : 0
        anchors.rightMargin: -5 * pixelDim + (((frame + 3) % 6) > 2 ? 1 : 0) * -pixelDim
    }
}
