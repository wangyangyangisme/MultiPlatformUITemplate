import QtQuick 2.5
import QtQuick.Controls 2.1

Rectangle {
    id: idMainMenu
    color: "#585858"
    visible: true
    x: -width
    height: idMainWindow.height - idTitleBar.height
    width: idMainWindow.mainMenuWidth
    property int submenuHeight: idMainWindow.orientation == idMainWindow.orientationLandscape ? idMainWindow.height * titleBarHeightLandscapeRatio : idMainWindow.height * titleBarHeightPortraitRatio
    property int animationDurationMain: 220
    property int animationDuration: 220
    property int currentlyActiveMenu: 1
    property int time: 0
    property int gestureDistance: 300

    Timer {
        id: timer
        running: false
        repeat: true
        interval: 1
        onTriggered: {  parent.time++ }
    }

    Rectangle {
        anchors.left: parent.right
        color: "transparent"
        height: parent.height
        width: parent.width * .085

        MouseArea {
            anchors.fill: parent

            drag {
                target: idMainMenu
                axis: Drag.XAxis
                minimumX: -idMainMenu.width
                maximumX: 0
            }

            onClicked: {
                timer.start()
            }

            onReleased: {
                timer.stop()

                if( Math.abs(idMainMenu.x) > 0.5*idMainMenu.width ) {
                    menuClose()
                } else {
                    menuOpen()
                }
            }
        }
    }

    Behavior on x { NumberAnimation { id: a; duration: animationDuration; easing.type: Easing.Linear } }

    function menuSetActive(menuNumber) {
        menuClearActive()
        currentlyActiveMenu = menuNumber
        switch(menuNumber)
        {
        case 1:
            idMenuEntry1.color = "#3e940a"
            break
        case 2:
            idMenuEntry2.color = "#3e940a"
            break
        case 3:
            idMenuEntry3.color = "#3e940a"
            break
        default:
        }

        idTitleBar.setTitleBarName(menuReturnName(menuNumber))
    }

    function menuReturnName(menuNumber) {
        switch(menuNumber)
        {
        case 1:
            return idMenuEntry1.text
        case 2:
            return idMenuEntry2.text
        case 3:
            return idMenuEntry3.text
        default:
        }
    }

    function menuClearActive() {
        switch(currentlyActiveMenu)
        {
        case 1:
            idMenuEntry1.color = "#585858"
            break
        case 2:
            idMenuEntry2.color = "#585858"
            break
        case 3:
            idMenuEntry3.color = "#585858"
            break
        default:
        }
    }

    function menuOpen() {
        idMainMenu.x=0
        idMainWindow.isMenuOpen = true
    }

    function menuClose() {
        idMainMenu.x=-width
        idMainWindow.isMenuOpen = false
    }

    function menuRefresh() {
        animationDuration = 0
        if(idMainWindow.isMenuOpen == true) {
            x=0
        }
        else if (idMainWindow.isMenuOpen == false) {
            x=-width
        }
        animationDuration = animationDurationMain
    }

//Here you can add  and personalize your menu entries
    MenuEntry {
        id: idMenuEntry1
        order: 1
        pageSource: "PageMain.qml"
        text: "Main"
        source: "/images/icons/phone.png"
    }

    MenuEntry {
        id: idMenuEntry2
        order: 2
        pageSource: "PageSettings.qml"
        anchors.top: idMenuEntry1.bottom
        text: "Settings"
        source: "/images/icons/setting.png"
    }

    MenuEntry {
        id: idMenuEntry3
        order: 3
        pageSource: "PageAbout.qml"
        anchors.top: idMenuEntry2.bottom
        text: "About"
        source: "/images/icons/note.png"
    }
}
