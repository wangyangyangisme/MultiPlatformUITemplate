import QtQuick 2.5

MultiPointTouchArea
{
    maximumTouchPoints : 2
    mouseEnabled: true
    z: -1
    property int touchPoint1PressedX: 0
    property int touchPoint1ReleasedX: 0
    property int touchPoint1DistancePressedReleasedX: 0
    property int touchPoint2PressedX: 0
    property int touchPoint2ReleasedX: 0
    property int touchPoint2DistancePressedReleasedX: 0
    property int time: 0
    property string textBufor: ""

    touchPoints: [ TouchPoint { id: touchPoint1 }, TouchPoint { id: touchPoint2 } ]

    Timer {
        id: swipeAreaTimer
        running: false
        repeat: true
        interval: 1
        onTriggered: {  parent.time++ }
    }

    onPressed:
    {
        if (idMainWindow.isTwoFingerGestures == false) //one finger gestures
        {
            console.log("One Finger Gesture start")
            touchPoint1PressedX = touchPoint1.x
            time = 0
            swipeAreaTimer.running = true
            console.log("Pressed touchPoint1PressedX: " + touchPoint1PressedX)

            //show/hide menu button on press
            if (touchPoint1PressedX < titleBarHeight && touchPoint1.y < titleBarHeight) {
                idMainWindow.menuShowHide()
            }
        }
        else if (idMainWindow.isTwoFingerGestures == true)
        {
            console.log("Two Fingers Gesture start")
            touchPoint1PressedX = touchPoint1.x
            touchPoint2PressedX = touchPoint2.x
            time = 0
            swipeAreaTimer.running = true
            console.log("Pressed touchPoint1PressedX: " + touchPoint1PressedX)
            console.log("Pressed touchPoint2PressedX: " + touchPoint2PressedX)

            //show/hide menu button on press
            if (touchPoint1PressedX < titleBarHeight && touchPoint1.y < titleBarHeight) { mainWindow.menuShowHide() }
        }
    }

    onReleased:
    {
        if(idMainWindow.isTwoFingerGestures == false)
        {
            touchPoint1ReleasedX = touchPoint1.x
            touchPoint1DistancePressedReleasedX = touchPoint1PressedX - touchPoint1ReleasedX
            console.log("Released touchPoint1ReleasedX: " + touchPoint1ReleasedX)
            if(touchPoint1DistancePressedReleasedX > idMainWindow.minimumGestureActivationDistance && time < maximumTimeGesture) menuSwipeGestureHide()
            else if((touchPoint1DistancePressedReleasedX *(-1)) > idMainWindow.minimumGestureActivationDistance && time < maximumTimeGesture) menuSwipeGestureShow()
            swipeAreaTimer.running = false

            //submenu actions when menu is open
            menuAction()

        }
        else if (idMainWindow.isTwoFingerGestures == true)
        {
            touchPoint1ReleasedX = touchPoint1.x
            touchPoint2ReleasedX = touchPoint2.x
            touchPoint1DistancePressedReleasedX = touchPoint1PressedX - touchPoint1ReleasedX
            touchPoint2DistancePressedReleasedX = touchPoint2PressedX - touchPoint2ReleasedX
            console.log("Released touchPoint1ReleasedX: " + touchPoint1ReleasedX)
            console.log("Released touchPoint2ReleasedX: " + touchPoint2ReleasedX)
            if(touchPoint1DistancePressedReleasedX > idMainWindow.minimumGestureActivationDistance && touchPoint2DistancePressedReleasedX > idMainWindow.minimumGestureActivationDistance && time < maximumTimeGesture) menuSwipeGestureHide()
            else if((touchPoint1DistancePressedReleasedX *(-1))  > idMainWindow.minimumGestureActivationDistance && touchPoint2DistancePressedReleasedX *(-1)  > idMainWindow.minimumGestureActivationDistance && time < maximumTimeGesture) menuSwipeGestureShow()
            swipeAreaTimer.running = false          

            //submenu actions when menu is open
            menuAction()
        }
    }

    function menuAction()
    {
        //submenu actions when menu is open
        if (idMainWindow.isMenuOpen == true)
        {
            //menu entry 1 action
            if (touchPoint1PressedX < idMainMenu.width && touchPoint1.y < titleBarHeight * 2 &&  touchPoint1.y > titleBarHeight) {
                idLoaderFrame.source="PageMain.qml"
                idMainWindow.menuShowHide()
                textBufor = idMainMenu.returnMenuName(1)
                idTitleBar.setTitleBarName(textBufor)
            }

            //menu entry 2 action
            if (touchPoint1PressedX < idMainMenu.width && touchPoint1.y < titleBarHeight * 3 &&  touchPoint1.y > titleBarHeight *2) {
                console.log("menu entry 2 clicked")
                idLoaderFrame.source="PageSettings.qml"
                idMainWindow.menuShowHide()
                textBufor = idMainMenu.returnMenuName(2)
                idTitleBar.setTitleBarName(textBufor)
            }

            //menu entry 3 action
            if (touchPoint1PressedX < idMainMenu.width && touchPoint1.y < titleBarHeight * 4 &&  touchPoint1.y > titleBarHeight *3) {
                console.log("menu entry 3 clicked")
                idLoaderFrame.source="PageAbout.qml"
                idMainWindow.menuShowHide()
                textBufor = idMainMenu.returnMenuName(3)
                idTitleBar.setTitleBarName(textBufor)
            }
        }
    }
}
