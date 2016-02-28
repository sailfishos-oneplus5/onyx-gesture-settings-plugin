#include "settingsui.h"
#include <QDir>
#include <QVariantMap>
#include <QVariantList>
#include <QThread>
#include <QSettings>
#include <QDebug>
#include <QtDBus/QtDBus>
#include <QtAlgorithms>
#include <QFileInfo>
#include <linux/input.h>


SettingsUi::SettingsUi(QObject *parent) :
    QObject(parent)
{

    /*
     *     UpVee_gesture = (buf[0] & BIT0)?1:0; //"V" -- flashlight
     *     DouSwip_gesture = (buf[0] & BIT1)?1:0;//"||" -- music
     *     DownVee_gesture = (buf[0] & BIT2)?1:0;//"^" -- voicecall
     *     LeftVee_gesture = (buf[0] & BIT3)?1:0; //">" -- music
     *     RightVee_gesture = (buf[0] & BIT4)?1:0;//"<" -- music
     *     Circle_gesture = (buf[0] & BIT6)?1:0; //"O" -- camera
     *     DouTap_gesture = (buf[0] & BIT7)?1:0; //double tap
     */
    gestureMasks.insert("camera", 0x40);
    gestureMasks.insert("music",0x1A);
    gestureMasks.insert("flashlight", 0x01);
    gestureMasks.insert("double_tap", 0x80);
    gestureMasks.insert("voicecall", 0x04);

    getCurrent();
}

void SettingsUi::setGesture(QString name, bool enable)
{
    qDebug() << "setting gesture" << name << enable;

    if (!gestureMasks.contains(name))
        return;

    if (enabledGestures.value(name) == enable)
        return;

    if (enable)
        currentMask |= gestureMasks.value(name);
    else
        currentMask &= ~gestureMasks.value(name);

    enabledGestures.insert(name, enable);

    QFile outputFile( "/proc/touchpanel/gesture_enable" );

    if (outputFile.open(QIODevice::WriteOnly))
    {
        QDataStream out(&outputFile);
        out << currentMask;
        outputFile.close();
    }
    else
    {
        qWarning() << "Failed to write";
    }
}

bool SettingsUi::getGesture(QString name)
{
    return enabledGestures.value(name);
}

bool SettingsUi::gestureEnabled(QString name)
{
    bool ret = false;

    QFile inputFile( "/proc/touchpanel/" + name + "_enable" );

    if ( inputFile.open( QIODevice::ReadOnly | QIODevice::Text ) )
    {
       QTextStream in( &inputFile );
       if (in.readLine().at(0) == '1')
           ret = true;
       inputFile.close();
    }

    qDebug() << "gesture" << name << "is" << (ret ? "enabled" : "disabled");

    return ret;
}

void SettingsUi::getCurrent()
{
    currentMask = 0x00;

    QMap<QString, char>::iterator i;

    for (i = gestureMasks.begin(); i != gestureMasks.end(); ++i)
    {
        bool x = gestureEnabled(i.key());
        enabledGestures.insert(i.key(), x);
        if (x)
            currentMask |= i.value();
    }
}

SettingsUi::~SettingsUi()
{
}
