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

    Behavior on x { NumberAnimation { duration: 350; easing.type: Easing.OutQuad } }

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
      }

           Rectangle {
               id: submenu1
               width: parent.width
               height: submenuHeight
               visible: true
               color: "grey"

           }

           Rectangle {
               id: submenu2
               anchors.top: submenu1.bottom
               width: parent.width
               height: submenuHeight
               visible: true
               color: "silver"
           }
}
