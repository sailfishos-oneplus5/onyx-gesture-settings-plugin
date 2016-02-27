import QtQuick 2.0
import Sailfish.Silica 1.0
import org.nemomobile.configuration 1.0
import com.kimmoli.onyxgesturesettings 1.0

Page
{
    id: page

    GestureSettings
    {
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
        }
    }    

    ConfigurationValue
    {
        id: onyxgesture_mainswitch
        key: "/apps/onyxgesture/mainswitch"
        defaultValue: 1
    }
   
}

