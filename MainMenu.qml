import QtQuick 2.8
import QtQuick.Controls 1.2

Rectangle {
    id: idMainMenu
    color: "gold"
    visible: false
    x: -width
    height: idMainWindow.height - idTitleBar.height
    width: idMainWindow.mainMenuWidth
    property int submenuHeight: idMainWindow.submenuHeight
    property int animationDurationMain: 300
    property int animationDuration: 300

    Behavior on x { NumberAnimation { duration: animationDuration; easing.type: Easing.InOutQuad } }

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
                if (visible==false) visible=true
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
        color: "light green"
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
    }

    Rectangle {
        id: submenu2
        anchors.top: submenu1.bottom
        width: parent.width
        height: submenuHeight
        visible: true
        color: "silver"

        Label {
            text: "Settings"
            anchors.centerIn: parent
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
    }

}
