import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle {
    id: idPageSettings
    color: "pink"

    Label {

        text: "TAK"
    }

    function test(a, b) {

        console.log("progreSS!!")
        idPageSettings.width = a
        idPageSettings.height = b
        }

    function refreshPage(width, height) {
        console.log("idPageSettings refresh")
        idPageSettings.width = width
        idPageSettings.height = height
    }
}


