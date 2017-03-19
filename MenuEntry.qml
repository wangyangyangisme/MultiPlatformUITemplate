import QtQuick 2.5
import QtQuick.Controls 2.1

//virtual object
//all changes made here will affect all menu entries

Rectangle {
    width: parent.width
    height: parent.submenuHeight
    visible: true
    color: "#585858"

    property alias source: idBorderImage.source
    property alias text: idLabel.text

    BorderImage {
        id: idBorderImage
        source: "" //at children object have to override this
        height: parent.height
        width: parent.height
        cache: true
        border.left: 0; border.top: 0
        border.right: 0; border.bottom: 0
    }

    Label {
        id: idLabel
        text: "" //at children object have to override this
        color: "#ffffff"
        font.pixelSize: 0.5*parent.height
        anchors.centerIn: parent
    }
}
