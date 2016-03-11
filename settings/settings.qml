import QtQuick 2.0
import Sailfish.Silica 1.0
import org.nemomobile.configuration 1.0
import com.kimmoli.onyxgesturesettings 1.0

Page
{
    id: page

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
                checked: gestures.get("double_tap")
                onCheckedChanged: gestures.set("double_tap", checked)
            }
            TextSwitch
            {
                //% "Flashlight"
                text: qsTrId("onyx-gesture-flashlight")
                //% "Turn flashlight on/off by drawing V on the screen."
                description: qsTrId("onyx-gesture-flashlight-description")
                checked: gestures.get("flashlight")
                onCheckedChanged: gestures.set("flashlight", checked)
            }
            TextSwitch
            {
                //% "Music controls"
                text: qsTrId("onyx-gesture-music")
                //% "Swipe down with two fingers to play or pause music. Draw < or > on the screen for previous or next track."
                description: qsTrId("onyx-gesture-music-description")
                checked: gestures.get("music")
                onCheckedChanged: gestures.set("music", checked)
            }
            TextSwitch
            {
                //% "Camera"
                text: qsTrId("onyx-gesture-camera")
                //% "Quickly start camera by drawing a circle on the screen."
                description: qsTrId("onyx-gesture-camera-description")
                checked: gestures.get("camera")
                onCheckedChanged: gestures.set("camera", checked)
            }
            TextSwitch
            {
                //% "Voicecall"
                text: qsTrId("onyx-gesture-voicecall")
                //% "Go to call history list by drawing Λ on the screen."
                description: qsTrId("onyx-gesture-voicecall-description")
                checked: gestures.get("voicecall")
                onCheckedChanged: gestures.set("voicecall", checked)
            }
        }
    }    

    ConfigurationValue
    {
        id: gestures
        key: "/apps/onyxgestures/enabled-gestures"
        defaultValue: [ "double_tap" ]

        function set(val, state)
        {
            var i = value.indexOf(val)
            var tmp = value

            if (state && i == -1)
                tmp.push(val)
            else if (!state && i > -1)
                tmp.splice(i, 1)

            value = tmp
        }

        function get(val)
        {
            return (gestures.value.indexOf(val) > -1)
        }
    }
}

