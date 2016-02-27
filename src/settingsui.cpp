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
}

void SettingsUi::setGesture(QString name, bool enable)
{
    qDebug() << "setting gesture" << name << enable;
}

SettingsUi::~SettingsUi()
{
}
