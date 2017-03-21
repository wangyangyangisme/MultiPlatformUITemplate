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
    property int animationDurationMain: 250
    property int animationDuration: 200
    property int currentlyActiveMenu: 1

    Rectangle {
        anchors.left: parent.right
        color: "transparent"
        height: parent.height
        width: parent.width * 0.085

        MouseArea {
            anchors.fill: parent

            onClicked: {
                console.log("test")
            }

            drag {
                target: idMainMenu
                axis: Drag.XAxis
                minimumX: -idMainMenu.width
                maximumX: 0
            }

            onReleased: {
                if( Math.abs(idMainMenu.x) > 0.5*idMainMenu.width ) {
                    menuClose()
                } else {
                    menuOpen()
                }
            }
        }
    }

    Behavior on x { NumberAnimation { duration: animationDuration; easing.type: Easing.Linear } }

    Connections {
        target: idMainWindow
        onMenuShowHide: {
            if (x==0) {
                idMainWindow.isMenuOpen = false
                x=-width
            }
            else {
                x=0
                idMainWindow.isMenuOpen = true
            }
        }

        onMenuSwipeGestureHide: {
            if (x==0) x=-width
            idMainWindow.isMenuOpen = false
        }

        onMenuSwipeGestureShow: {
            if (visible==false) visible=true
            x=0
            idMainWindow.isMenuOpen = true
        }

        onMenuRefresh: {
            animationDuration = 0
            if(idMainWindow.isMenuOpen == true) {
                x=0
            }
            else if (idMainWindow.isMenuOpen == false) {
                x=-width
            }
            animationDuration = animationDurationMain
        }
    }

    MenuEntry {
        id: idMenuEntry1
        text: "Main"
        source: "/images/icons/phone.png"
    }

    MenuEntry {
        id: idMenuEntry2
        anchors.top: idMenuEntry1.bottom
        text: "Settings"
        source: "/images/icons/setting.png"
    }

    MenuEntry {
        id: idMenuEntry3
        anchors.top: idMenuEntry2.bottom
        text: "About"
        source: "/images/icons/note.png"
    }

    function returnMenuName(menuNumber) {
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

    function setActiveMenu(menuNumber) {
        clearActiveMenu(currentlyActiveMenu)
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
    }

    function clearActiveMenu(menuNumber) {
        switch(menuNumber)
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
}
