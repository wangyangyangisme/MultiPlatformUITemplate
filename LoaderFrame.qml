import QtQuick 2.0

Item {
    property alias source: idLoader.source

    Loader {
        id: idLoader
        asynchronous: true
        onLoaded: { item.refreshPage(idMainWindow.width, idMainMenu.height) }
    }

    onParentChanged: {
        console.log("LoaderFrame -> loading start page")
        idLoader.source="PageMain.qml"
    }

}
