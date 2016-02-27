TARGET = onyxgesturesettings
PLUGIN_IMPORT_PATH = com/kimmoli/onyxgesturesettings
QT += dbus
QT -= gui

TEMPLATE = lib
CONFIG += qt plugin hide_symbols
QT += qml quick

INCLUDEPATH += ..
LIBS += -L.. -lonyxgesturesettings-qt5
SOURCES += plugin.cpp

target.path = $$[QT_INSTALL_QML]/$$PLUGIN_IMPORT_PATH
qmldir.files += \
        $$_PRO_FILE_PWD_/qmldir
qmldir.path +=  $$target.path
INSTALLS += target qmldir

OTHER_FILES += qmldir
