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

    Rectangle {
        id: edge
        anchors.left: parent.right
        color: "#ffffff"
        width: parent.width*0.05
        height: parent.height
    }

    Rectangle {
        id: submenu1
        width: parent.width
        height: submenuHeight
        visible: true
        color: "grey"

        Label {
            text: "Main"
            anchors.centerIn: parent
        }

        Image {
            source: "/images/icons/phone.png"
            height: parent.height
            width: parent.height
            cache: true
            fillMode: Image.PreserveAspectFit
        }
    }

    Rectangle {
        id: submenu2
        anchors.top: submenu1.bottom
        width: parent.width
        height: submenuHeight
        visible: true
        color: "grey"

        Label {
            text: "Settings"
            anchors.centerIn: parent
        }

        Image {
            source: "/images/icons/setting.png"
            height: parent.height
            width: parent.height
            cache: true
            fillMode: Image.PreserveAspectFit
        }
    }

    Rectangle {
        id: submenu3
        anchors.top: submenu2.bottom
        width: parent.width
        height: submenuHeight
        visible: true
        color: "grey"

        Label {
            text: "About"
            anchors.centerIn: parent
        }

        Image {
            source: "/images/icons/note.png"
            height: parent.height
            width: parent.height
            cache: true
            fillMode: Image.PreserveAspectFit
        }
    }
}
