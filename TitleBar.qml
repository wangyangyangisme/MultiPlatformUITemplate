import QtQuick 2.5
import QtQuick.Controls 2.1

Rectangle {
    color: "#434343"
    width: idMainWindow.width
    height: titleBarHeight

    property string titleBarText: "MultiPlatformTemplate"

    Rectangle {
        id: idMainMenuButton
        color: "transparent"
        height: parent.height
        width: height



        Rectangle {
            id: rect1
            color: "#fcfcfc"
            anchors.centerIn: parent
            width: parent.width * 0.7
            height: parent.height * 0.1
        }

        Rectangle {
            id: rect2
            color: "#fcfcfc"
            anchors.left: rect1.left
            y: rect1.y + rect1.height * 1.7
            width: parent.width * 0.7
            height: parent.height * 0.1
        }

        Rectangle {
            id: rect3
            color: "#fcfcfc"
            anchors.left: rect1.left
            y: rect1.y - rect1.height * 1.7
            width: parent.width * 0.7
            height: parent.height * 0.1
        }
    }

    Label {
        anchors.left: idMainMenuButton.right
        anchors.centerIn: parent
        text: titleBarText
        color: "#ffffff"
        font.pixelSize: 0.5*parent.height
    }
}
