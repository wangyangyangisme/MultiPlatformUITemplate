import QtQuick 2.5
import QtQuick.Controls 2.1

Rectangle {
    color: "#252525"

    function refreshPage(widthA, heightA) {
        console.log("idPageSettings refresh")
        width = widthA
        height = heightA
    }
}


