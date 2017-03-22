import QtQuick 2.5

MultiPointTouchArea
{ 
    id: idTouchArea
    mouseEnabled: true
    maximumTouchPoints : 1
    property int touchPoint1PressedX: 0
    property int touchPoint1ReleasedX: 0
    property int touchPoint1DistancePressedReleasedX: 0
    property int time: 0

    touchPoints: [ TouchPoint { id: touchPoint1 } ]

    Timer {
        id: swipeAreaTimer
        running: false
        repeat: true
        interval: 1
        onTriggered: {  parent.time++ }
    }

    onPressed: {
        {
            touchPoint1PressedX = touchPoint1.x
            time = 0
            swipeAreaTimer.running = true
            if (touchPoint1PressedX < titleBarHeight && touchPoint1.y < titleBarHeight) {
                idMainWindow.isMenuOpen ? idMainMenu.menuClose() : idMainMenu.menuOpen()
            }
        }
    }

    onReleased: {
        touchPoint1ReleasedX = touchPoint1.x
        touchPoint1DistancePressedReleasedX = touchPoint1PressedX - touchPoint1ReleasedX
        if(touchPoint1DistancePressedReleasedX > idMainWindow.minimumGestureActivationDistance && time < maximumTimeGesture) idMainMenu.menuClose()
        else if((touchPoint1DistancePressedReleasedX *(-1)) > idMainWindow.minimumGestureActivationDistance && time < maximumTimeGesture) idMainMenu.menuOpen()
        swipeAreaTimer.running = false
    }
}
