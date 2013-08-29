TARGET = nemoalarms
PLUGIN_IMPORT_PATH = org/nemomobile/alarms

TEMPLATE = lib
CONFIG += qt plugin hide_symbols
equals(QT_MAJOR_VERSION, 4): QT += declarative
equals(QT_MAJOR_VERSION, 5): QT += qml quick

equals(QT_MAJOR_VERSION, 4): target.path = $$[QT_INSTALL_IMPORTS]/$$PLUGIN_IMPORT_PATH
equals(QT_MAJOR_VERSION, 5): target.path = $$[QT_INSTALL_QML]/$$PLUGIN_IMPORT_PATH
INSTALLS += target

qmldir.files += $$_PRO_FILE_PWD_/qmldir
qmldir.path +=  $$target.path
INSTALLS += qmldir

QT += dbus

CONFIG += link_pkgconfig
equals(QT_MAJOR_VERSION, 4): PKGCONFIG += timed timed-voland
equals(QT_MAJOR_VERSION, 5): PKGCONFIG += timed-qt5 timed-voland-qt5

isEmpty(SRCDIR) SRCDIR = "."

SOURCES += $$SRCDIR/plugin.cpp \
    $$SRCDIR/alarmsbackendmodel.cpp \
    $$SRCDIR/alarmsbackendmodel_p.cpp \
    $$SRCDIR/alarmobject.cpp \
    $$SRCDIR/alarmhandlerinterface.cpp \
    $$SRCDIR/alarmdialogobject.cpp \
    $$SRCDIR/interface.cpp

HEADERS += $$SRCDIR/alarmsbackendmodel.h \
    $$SRCDIR/alarmsbackendmodel_p.h \
    $$SRCDIR/alarmobject.h \
    $$SRCDIR/alarmhandlerinterface.h \
    $$SRCDIR/alarmdialogobject.h \
    $$SRCDIR/interface.h
