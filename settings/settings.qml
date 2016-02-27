import QtQuick 2.0
import Sailfish.Silica 1.0
import org.nemomobile.configuration 1.0
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
                checked: gestures.getGesture("double_tap")
                onCheckedChanged: gestures.setGesture("double_tap", checked)
            }
            TextSwitch
            {
                //% "Flashlight (V)"
                text: qsTrId("onyx-gesture-flashlight")
                checked: gestures.getGesture("flashlight")
                onCheckedChanged: gestures.setGesture("flashlight", checked)
            }
            TextSwitch
            {
                //% "Music (||, <, >)"
                text: qsTrId("onyx-gesture-music")
                checked: gestures.getGesture("music")
                onCheckedChanged: gestures.setGesture("music", checked)
            }
            TextSwitch
            {
                //% "Camera (O)"
                text: qsTrId("onyx-gesture-camera")
                checked: gestures.getGesture("camera")
                onCheckedChanged: gestures.setGesture("camera", checked)
            }
        }
    }    

    ConfigurationValue
    {
        id: onyxgesture_mainswitch
        key: "/apps/onyxgesture/mainswitch"
        defaultValue: 1
    }
   
}

