import QtQuick 2.5
import QtQuick.Controls 2.1

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


