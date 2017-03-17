import QtQuick 2.5
import QtQuick.Controls 2.1

Rectangle {
    color: "red"
    width: parent.width

    property string titleBarText: "MultiPlatformTemplate"

    Rectangle {
        id: idMainMenuButton
        color: "blue"
        height: parent.height
        width: height
    }


    Label
    {
        anchors.left: idMainMenuButton.right
        anchors.centerIn: parent
        text: titleBarText
        color: "white"
        font.pixelSize: 0.5*parent.height
    }

}
