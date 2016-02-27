#include <QtGlobal>
#include <QtQml>
#include <QQmlEngine>
#include <QQmlExtensionPlugin>
#include <QTranslator>
#include "settingsui.h"

class Translator : public QTranslator
{
public:
    Translator(QObject *parent)
        : QTranslator(parent)
    {
        qApp->installTranslator(this);
    }

    ~Translator()
    {
        qApp->removeTranslator(this);
    }
};

class Q_DECL_EXPORT OnyxGestureSettingsPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
#if QT_VERSION >= QT_VERSION_CHECK(5, 0, 0)
    Q_PLUGIN_METADATA(IID "com.kimmoli.onyxgesturesettings")
#endif
public:
    OnyxGestureSettingsPlugin()
    {
    }

    virtual ~OnyxGestureSettingsPlugin()
    {
    }

    void registerTypes(const char *uri)
    {
        Q_ASSERT(uri == QLatin1String("com.kimmoli.onyxgesturesettings"));

        qmlRegisterType<SettingsUi>(uri, 1, 0, "GestureSettings");
    }

    void initializeEngine(QQmlEngine *engine, const char *uri)
    {
        Q_ASSERT(uri == QLatin1String("com.kimmoli.onyxgesturesettings"));

        Translator *engineeringEnglish = new Translator(engine);
        if (!engineeringEnglish->load("onyx-gesture-settings_eng_en", "/usr/share/translations"))
            qWarning() << "failed loading translator" << "onyx-gesture-settings_eng_en";

        Translator *translator = new Translator(engine);
        if (!translator->load(QLocale(), "onyx-gesture-settings", "-", "/usr/share/translations"))
            qWarning() << "failed loading translator" << "onyx-gesture-settings" << QLocale();

        QQmlExtensionPlugin::initializeEngine(engine, uri);
    }
};

#include "plugin.moc"
