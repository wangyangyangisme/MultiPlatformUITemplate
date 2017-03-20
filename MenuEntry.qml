import QtQuick 2.5
import QtQuick.Controls 2.1

//Virtual only, use as basis for menu entries
//All changes made here affect every object using this pattern

Rectangle {
    width: parent.width
    height: parent.submenuHeight
    color: "#585858"

    property alias source: idBorderImage.source
    property alias text: idLabel.text
    property int order: 0 //position in menu -> need to override

    BorderImage {
        id: idBorderImage
        anchors.verticalCenter: parent.verticalCenter
        source: "" //at children object have to override this
        height: parent.height * 0.7
        width: parent.height * 0.7
        cache: true
        border.left: 0; border.top: 0
        border.right: 0; border.bottom: 0
    }

    Label {
        id: idLabel
        text: "" //at children object have to override this
        color: "#ffffff"
        font.pixelSize: 0.4 * parent.height
        anchors.centerIn: parent
    }
}
