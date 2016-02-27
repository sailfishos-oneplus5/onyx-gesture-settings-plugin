#ifndef SETTINGSUI_H
#define SETTINGSUI_H
#include <QObject>
#include <QVariantList>
#include <QTimer>
#include <QMap>
#include <QDir>

class Q_DECL_EXPORT SettingsUi : public QObject
{
    Q_OBJECT

public:
    explicit SettingsUi(QObject *parent = 0);
    virtual ~SettingsUi();

    Q_INVOKABLE void setGesture(QString name, bool enable);
    Q_INVOKABLE bool getGesture(QString name);

private:
    bool gestureEnabled(QString name);
    QMap<QString, bool> enabledGestures;
    QMap<QString, char> gestureMasks;
    unsigned char currentMask;
    void getCurrent();
};


#endif // SETTINGSUI_H
