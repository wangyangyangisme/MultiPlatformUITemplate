import QtQuick 2.8
import QtQuick.Window 2.2

Window {
//Main window properties and initial states
    property int orientation: 0 //0 = portrait, 1 = landscape
    id: idMainWindow
    title: qsTr("MultiPlatformTemplate") //Application name
    visible: true
    width: 360
    height: 640

//Title bar properties and initial states
    property double titleBarHeightLandscapeRatio: 0.09
    property double titleBarHeightPortraitRatio: 0.06
    property int titleBarHeight: idMainWindow.orientation == idMainWindow.orientationLandscape ? idMainWindow.height * titleBarHeightLandscapeRatio : idMainWindow.height * titleBarHeightPortraitRatio

//Main menu properties and initial states
    property double mainMenuWidthLandscapeRatio: 0.35
    property double mainMenuWidthPortraitRatio: 0.65
    property int mainMenuWidth: idMainWindow.orientation == idMainWindow.orientationLandscape ? idMainWindow.width * mainMenuWidthLandscapeRatio : idMainWindow.width * mainMenuWidthPortraitRatio
    property bool isMenuOpen: false

//Swipe area properties and initial states
    property int maximumTimeGesture: 190 //[ms] in this time you must move from point a to b to activate gesture
    property double swipeAreaGesturePortraitRatio: 0.32
    property double swipeAreaGestureLandscapeRatio: 0.16
    property int minimumGestureActivationDistance: idMainWindow.orientation == 0 ? idMainWindow.width * swipeAreaGesturePortraitRatio : idMainWindow.width * swipeAreaGestureLandscapeRatio
//End of properties section

    onWidthChanged: {       
        idMainWindow.mainWindowRefresh()
    }

    onHeightChanged: {
        idMainWindow.mainWindowRefresh()
    }

    Component.onCompleted: {
        idMainMenu.menuSetActive(1)
    }

    function mainWindowRefresh() {
        if( idMainWindow.width > idMainWindow.height  && idMainWindow.orientation != 1) {
            idMainWindow.orientation = 1
            titleBarHeight = idMainWindow.height * titleBarHeightLandscapeRatio
            idMainMenu.submenuHeight = idMainWindow.height * titleBarHeightLandscapeRatio


        } else if (idMainWindow.width < idMainWindow.height && idMainWindow.orientation != 0){
            idMainWindow.orientation = 0
            titleBarHeight = idMainWindow.height * titleBarHeightPortraitRatio
            idMainMenu.submenuHeight = idMainWindow.height * titleBarHeightPortraitRatio
        }
        idLoaderFrame.refreshPage(idMainWindow.width, idMainWindow.height - titleBarHeight)
        idMainMenu.menuRefresh()
    }

    LoaderFrame {
        id: idLoaderFrame
        anchors.top: idTitleBar.bottom
    }

    TouchArea {
        id: idSwipeArea
        anchors.fill: parent
    }

    MainMenu {
        id: idMainMenu
        anchors.top: idTitleBar.bottom
    }

    TitleBar {
        id: idTitleBar
        anchors.top: idMainWindow.top
    }
}
