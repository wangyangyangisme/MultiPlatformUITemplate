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
    property int animationDuration: 250

    Behavior on x { NumberAnimation { duration: animationDuration; easing.type: Easing.Linear } }

    Connections {
        target: idMainWindow
        onMenuShowHide: {
            if (x==0) {
                console.log("mainMenu -> hide")
                idMainWindow.isMenuOpen = false
                x=-width
            }
            else {
                console.log("mainMenu -> show")
                x=0
                idMainWindow.isMenuOpen = true
            }
        }

        onMenuSwipeGestureHide: {
            console.log("mainMenuSwipe -> hide")
            if (x==0) x=-width
            idMainWindow.isMenuOpen = false
        }

        onMenuSwipeGestureShow: {
            console.log("mainMenuSwipe -> show")
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
                console.log("menu hidden")
                x=0;
                x=-width
            }
            animationDuration = animationDurationMain
        }
    }

    MenuEntry {
        id: idMenuEntry1
        anchors.top: submenu2.bottom
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
}
