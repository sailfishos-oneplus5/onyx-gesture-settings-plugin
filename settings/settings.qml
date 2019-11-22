import QtQuick 2.2
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0
import com.kimmoli.onyxgesturesettings 1.0

Page {
    id: page

    // Flickable wrapper
    SilicaFlickable {
        id: flick
        anchors.fill: parent
        contentHeight: col.height

        // Page content
        Column {
            id: col
            width: page.width
            // Sleep mode gestures
            PageHeader {
                //% "Sleep mode gestures"
                title: qsTrId("onyx-gesture-settings-title")
            }

            // Double tap to wake
            TextSwitch {
                //% "Double tap to wake"
                text: qsTrId("onyx-gesture-double-tap")
                //% "Double tap on the screen to wake up from suspend"
                description: qsTrId("onyx-gesture-double-tap-description")
                checked: gestures.get("double_tap")
                onCheckedChanged: gestures.set("double_tap", checked)
            }

            // Flashlight toggle
            TextSwitch {
                //% "Flashlight toggle"
                text: qsTrId("onyx-gesture-flashlight")
                //% "Toggle flashlight on/off by drawing a 'V' on the screen"
                description: qsTrId("onyx-gesture-flashlight-description")
                checked: gestures.get("flashlight")
                onCheckedChanged: gestures.set("flashlight", checked)
            }

            // Music controls
            TextSwitch {
                //% "Music controls"
                text: qsTrId("onyx-gesture-music")
                //% "Swipe down with two fingers to play/pause music. Draw a '<' or '>' on the screen for previous or next track"
                description: qsTrId("onyx-gesture-music-description")
                checked: gestures.get("music")
                onCheckedChanged: gestures.set("music", checked)
            }

            // Launch camera
            TextSwitch {
                //% "Launch camera"
                text: qsTrId("onyx-gesture-camera")
                //% "Quickly start camera by drawing a circle on the screen"
                description: qsTrId("onyx-gesture-camera-description")
                checked: gestures.get("camera")
                onCheckedChanged: gestures.set("camera", checked)
            }

            // Call history
            TextSwitch {
                //% "Call history"
                text: qsTrId("onyx-gesture-voicecall")
                //% "Go to call history list by drawing a 'Λ' on the screen"
                description: qsTrId("onyx-gesture-voicecall-description")
                checked: gestures.get("voicecall")
                onCheckedChanged: gestures.set("voicecall", checked)
            }
        }
    }

    // Wrapper for gesture-daemon's dconf values
    ConfigurationValue {
        id: gestures
        key: "/apps/onyxgestures/enabled-gestures"
        defaultValue: [ "double_tap" ]

        // Func: Set enabled state for a gesture
        function set(gesture, isEnabled) {
            var savedIndex = value.indexOf(gesture)
            var enabledGestures = value

            // Gesture just enabled & not in saved list => add it there
            if (isEnabled && savedIndex === -1)
                enabledGestures.push(gesture)
            // Gesture just disabled & in saved list => remove it
            else if (!isEnabled && savedIndex > -1)
                enabledGestures.splice(savedIndex, 1)

            value = enabledGestures
        }

        // Boolean: Get enabled state of a gesture
        function get(gesture) {
            return (value.indexOf(gesture) > -1) // gestures.value...
        }
    }
}
