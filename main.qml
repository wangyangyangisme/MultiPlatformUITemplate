import QtQuick 2.8
import QtQuick.Window 2.2

Window {
//Main window properties
    property int orientation: 0 //0 = portrait, 1 = landscape
    property bool isFullScreen: true
    id: idMainWindow
    title: qsTr("MultiPlatformTemplate")
    visible: true
    width: 360
    height: 640
    minimumHeight: 360
    minimumWidth: 360
    visibility: isFullScreen ? Window.FullScreen : Window.Windowed //can't be windowed in android!! -> bug

//Title bar properties
    property double titleBarHeightLandscapeRatio: 0.125
    property double titleBarHeightPortraitRatio: 0.06
    property int titleBarHeight: idMainWindow.orientation == idMainWindow.orientationLandscape ? idMainWindow.height * titleBarHeightLandscapeRatio : idMainWindow.height * titleBarHeightPortraitRatio

//Main menu properties
    property double mainMenuWidthLandscapeRatio: 0.5
    property double mainMenuWidthPortraitRatio: 0.8
    property int mainMenuWidth: idMainWindow.orientation == idMainWindow.orientationLandscape ? idMainWindow.width * mainMenuWidthLandscapeRatio : idMainWindow.width * mainMenuWidthPortraitRatio
    property bool isMenuOpen: false
    property bool isAutohideMenuAfterChoice: true

//Swipe area properties
    property bool isTwoFingerGestures: false //if false one finger gesture only avaiable
    property int maximumTimeGesture: 190 //[ms] in this time you must move from point a to b to activate gesture
    //property int minimumTimeGesture: 20 //[ms] minimum time to make gesture start
    property double swipeAreaGesturePortraitRatio: 0.32
    property double swipeAreaGestureLandscapeRatio: 0.16
    property int minimumGestureActivationDistance: idMainWindow.orientation == 0 ? idMainWindow.width * swipeAreaGesturePortraitRatio : idMainWindow.width * swipeAreaGestureLandscapeRatio
//End of properties section

    signal menuShowHide()
    signal menuSwipeGestureHide()
    signal menuSwipeGestureShow()
    signal menuRefresh()

    onWidthChanged: {
        if( width > height  && idMainWindow.orientation != 1) {
            idMainWindow.orientation = 1
            titleBarHeight = idMainWindow.height * titleBarHeightLandscapeRatio
            idMainMenu.submenuHeight = idMainWindow.height * titleBarHeightLandscapeRatio
            console.log("main window aspect ratio changed -> orientation = Landscape")

        } else if (width < height && idMainWindow.orientation != 0){
            idMainWindow.orientation = 0
            titleBarHeight = idMainWindow.height * titleBarHeightPortraitRatio
            idMainMenu.submenuHeight = idMainWindow.height * titleBarHeightPortraitRatio
            console.log("main window aspect ratio changed -> orientation = Portrait")
        }
        idLoaderFrame.item.refreshPage(idMainWindow.width, idMainMenu.height) //at start one of pege should be loaded, eg Main Page -> for now error when no page loaded
        menuRefresh()
    }

    TitleBar {
        id: idTitleBar
        height: titleBarHeight
        anchors.top: parent.top
    }

    Item {
        anchors.top: idTitleBar.bottom
        width: idMainWindow.width
        height: idMainMenu.height

        Loader {
            id: idLoaderFrame
            asynchronous: true
            onLoaded: { item.refreshPage(idMainWindow.width, idMainMenu.height) }
        }
    }

    MainMenu {
        id: idMainMenu
        anchors.top: idTitleBar.bottom
        submenuHeight: idMainWindow.orientation == idMainWindow.orientationLandscape ? idMainWindow.height * titleBarHeightLandscapeRatio : idMainWindow.height * titleBarHeightPortraitRatio
    }

    TouchArea {
        id: idSwipeArea
        anchors.fill: parent
    }
}
