import QtQuick 2.0

Item {
    property alias source: idLoader.source

    Loader {
        id: idLoader
        width: idMainWindow.width
        height: idMainMenu.height
        asynchronous: false
        onLoaded: { item.refreshPage(idMainWindow.width, idMainMenu.height) }
    }


    Component.onCompleted: idLoader.source="PageMain.qml" //Setting Start page


    function refreshPage(width, height) {
        idLoader.item.refreshPage(width, height)
    }

}
