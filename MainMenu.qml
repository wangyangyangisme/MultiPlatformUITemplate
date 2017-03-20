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

    Behavior on x { NumberAnimation { duration: animationDuration; easing.type: Easing.Linear } }

    Connections {
        target: idMainWindow
        onMenuShowHide: {
            if (x==0) {
//                console.log("idMainMenu -> onMenuShowHide -> hide")
                idMainWindow.isMenuOpen = false
                x=-width
            }
            else {
//                console.log("idMainMenu -> onMenuShowHide -> show")
                x=0
                idMainWindow.isMenuOpen = true
            }
        }

        onMenuSwipeGestureHide: {
//            console.log("idMainMenu -> onMenuSwipeGestureHide")
            if (x==0) x=-width
            idMainWindow.isMenuOpen = false
        }

        onMenuSwipeGestureShow: {
//            console.log("idMainMenu -> onMenuSwipeGestureShow")
            if (visible==false) visible=true
            x=0
            idMainWindow.isMenuOpen = true
        }

        onMenuRefresh: {
//            console.log("idMainMenu -> onMenuRefresh")
            animationDuration = 0
            if(idMainWindow.isMenuOpen == true) {
                x=0
            }
            else if (idMainWindow.isMenuOpen == false) {
                x=0;
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
//        console.log("idMainMenu -> returnMenuName")
        switch(menuNumber)
        {
        case 1:
            return idMenuEntry1.text
        case 2:
            return idMenuEntry2.text
        case 3:
            return idMenuEntry3.text
        default:
//            console.log("idMainMenu -> returnMenuName -> ERROR")
        }
    }

    function setActiveMenu(menuNumber) {
//        console.log("idMainMenu -> setActiveMenu")
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
//            console.log("idMainMenu -> setActiveMenu -> ERROR")
        }
    }

    function clearActiveMenu(menuNumber) {
//        console.log("idMainMenu -> clearActiveMenu")
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
//            console.log("idMainMenu -> clearActiveMenu -> ERROR")
        }
    }
}
