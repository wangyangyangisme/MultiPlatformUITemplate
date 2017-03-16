import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle {
    id: idPageMain
    color: "pink"

    Label {
        text: "Page MAIN"
        anchors.centerIn: parent
    }

    function refreshPage(width, height) {
        console.log("idPageMain")
        idPageMain.width = width
        idPageMain.height = height
    }
}


