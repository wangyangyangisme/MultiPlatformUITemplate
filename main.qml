import QtQuick 2.8
import QtQuick.Window 2.2

Window {
//Main window properties
    property int orientation: 0 //0 = portrait, 1 = landscape //starting orientation
    property bool isFullScreen: false
    id: idMainWindow
    title: qsTr("MultiPlatformTemplate") //Application name
    visible: true
    width: 360
    height: 640
    minimumHeight: 360
    minimumWidth: 360
    visibility: isFullScreen ? Window.FullScreen : Window.Windowed //can't be windowed in android!! -> bug

//Title bar properties
    property double titleBarHeightLandscapeRatio: 0.09
    property double titleBarHeightPortraitRatio: 0.06
    property int titleBarHeight: idMainWindow.orientation == idMainWindow.orientationLandscape ? idMainWindow.height * titleBarHeightLandscapeRatio : idMainWindow.height * titleBarHeightPortraitRatio

//Main menu properties
    property double mainMenuWidthLandscapeRatio: 0.35
    property double mainMenuWidthPortraitRatio: 0.65
    property int mainMenuWidth: idMainWindow.orientation == idMainWindow.orientationLandscape ? idMainWindow.width * mainMenuWidthLandscapeRatio : idMainWindow.width * mainMenuWidthPortraitRatio
    property bool isMenuOpen: false
    property bool isAutohideMenuAfterChoice: true

//Swipe area properties
    property bool isTwoFingerGestures: false //if false one finger gesture only avaiable
    property int maximumTimeGesture: 190 //[ms] in this time you must move from point a to b to activate gesture
    //property int minimumTimeGesture: 20 //[ms] minimum time to make gesture start //TODO
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
//            console.log("idMainWindow -> onWidthChanged -> orientation = Landscape")
            idMainWindow.orientation = 1
            titleBarHeight = idMainWindow.height * titleBarHeightLandscapeRatio
            idMainMenu.submenuHeight = idMainWindow.height * titleBarHeightLandscapeRatio


        } else if (width < height && idMainWindow.orientation != 0){
//            console.log("idMainWindow -> onWidthChanged -> orientation = Portrait")
            idMainWindow.orientation = 0
            titleBarHeight = idMainWindow.height * titleBarHeightPortraitRatio
            idMainMenu.submenuHeight = idMainWindow.height * titleBarHeightPortraitRatio

        }
        idLoaderFrame.refreshPage(idMainWindow.width, idMainWindow.height - titleBarHeight)
        menuRefresh()
    }

    onHeightChanged: {
        if( idMainWindow.width > idMainWindow.height  && idMainWindow.orientation != 1) {
//            console.log("idMainWindow -> onHeightChanged -> orientation = Landscape")
            idMainWindow.orientation = 1
            titleBarHeight = idMainWindow.height * titleBarHeightLandscapeRatio
            idMainMenu.submenuHeight = idMainWindow.height * titleBarHeightLandscapeRatio


        } else if (idMainWindow.width < idMainWindow.height && idMainWindow.orientation != 0){
//            console.log("idMainWindow -> onHeightChanged -> orientation = Portrait")
            idMainWindow.orientation = 0
            titleBarHeight = idMainWindow.height * titleBarHeightPortraitRatio
            idMainMenu.submenuHeight = idMainWindow.height * titleBarHeightPortraitRatio
        }
        idLoaderFrame.refreshPage(idMainWindow.width, idMainWindow.height - titleBarHeight)
        menuRefresh()
    }

    Component.onCompleted: {
//        console.log("idMainWindow -> Component.onCompleted")
        setStartupStates()
    }

    function setStartupStates() {
//        console.log("idMainWindow -> setStartupStates")
        idMainMenu.setActiveMenu(1)
        idTitleBar.setTitleBarName("Main")
    }

    TitleBar {
        id: idTitleBar
        anchors.top: idMainWindow.top
    }

    LoaderFrame {
        id: idLoaderFrame
        anchors.top: idTitleBar.bottom
    }

    MainMenu {
        id: idMainMenu
        anchors.top: idTitleBar.bottom
    }

    TouchArea {
        id: idSwipeArea
        anchors.fill: parent
    }
}
