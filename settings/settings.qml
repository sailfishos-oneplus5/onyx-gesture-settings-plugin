import QtQuick 2.0
import Sailfish.Silica 1.0
import com.kimmoli.onyxgesturesettings 1.0

Page
{
    id: page

    GestureSettings
    {
        id: gestures
    }

    SilicaFlickable
    {
        id: flick
        anchors.fill: parent

        contentHeight: column.height

        Column
        {
            id: column

            width: page.width

            PageHeader
            {
                //: page header
                //% "Gesture settings"
                title: qsTrId("onyx-gesture-settings-title")
            }

            TextSwitch
            {
                //% "Double tap to wakeup"
                text: qsTrId("onyx-gesture-double-tap")
                //% "Double tap on the screen to wakeup."
                description: qsTrId("onyx-gesture-double-tap-description")
                checked: gestures.getGesture("double_tap")
                onCheckedChanged: gestures.setGesture("double_tap", checked)
            }
            TextSwitch
            {
                //% "Flashlight"
                text: qsTrId("onyx-gesture-flashlight")
                //% "Turn flashlight on/off by drawing V on the screen."
                description: qsTrId("onyx-gesture-flashlight-description")
                checked: gestures.getGesture("flashlight")
                onCheckedChanged: gestures.setGesture("flashlight", checked)
            }
            TextSwitch
            {
                //% "Music controls"
                text: qsTrId("onyx-gesture-music")
                //% "Swipe down with two fingers to play or pause music. Draw < or > on the screen for previous or next track."
                description: qsTrId("onyx-gesture-music-description")
                checked: gestures.getGesture("music")
                onCheckedChanged: gestures.setGesture("music", checked)
            }
            TextSwitch
            {
                //% "Camera"
                text: qsTrId("onyx-gesture-camera")
                //% "Quickly start camera by drawing a circle on the screen."
                description: qsTrId("onyx-gesture-camera-description")
                checked: gestures.getGesture("camera")
                onCheckedChanged: gestures.setGesture("camera", checked)
            }
        }
    }    
}

