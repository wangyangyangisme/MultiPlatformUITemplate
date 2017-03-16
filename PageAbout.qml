import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle {
    id: idPageAbout
    color: "light blue"

    Label {
        text: "PAGE about"
        anchors.centerIn: parent
    }

    function refreshPage(width, height) {
        console.log("idPageSettings refresh")
        idPageAbout.width = width
        idPageAbout.height = height
    }
}


