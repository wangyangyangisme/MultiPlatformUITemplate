import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle {
    id: idPageSettings
    color: "orange"

    Label {
        text: "page settings"
        anchors.centerIn: parent
    }

    function refreshPage(width, height) {
        console.log("idPageSettings refresh")
        idPageSettings.width = width
        idPageSettings.height = height
    }
}


