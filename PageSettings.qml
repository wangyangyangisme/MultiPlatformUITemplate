import QtQuick 2.5
import QtQuick.Controls 2.1

Rectangle {
    id: idPageSettings
    color: "orange"

    Label {
        text: "page settings"
        anchors.centerIn: parent
    }

    Slider {
        width: 100
        height: 100
    }



    Button {
        anchors.centerIn: parent
        text: "click"




        onClicked: {
            color = "red"
        }
    }



    function refreshPage(width, height) {
        console.log("idPageSettings refresh")
        idPageSettings.width = width
        idPageSettings.height = height
    }
}


