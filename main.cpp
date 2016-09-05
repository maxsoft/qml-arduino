#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>
#include <QSerialPort>
#include <QSerialPortInfo>
#include <QDebug>
#include "arduinomgr.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQuickView *view = new QQuickView;
    ArduinoMgr arduino(0);
    view->engine()->rootContext()->setContextProperty("arduino", &arduino);

    QStringList ports;


    foreach (const QSerialPortInfo &info, QSerialPortInfo::availablePorts()) {
     qDebug() << "Name : " << info.portName();
     qDebug() << "Description : " << info.description();
     qDebug() << "Manufacturer: " << info.manufacturer();
     ports+= info.portName();
    }


    view->setSource(QStringLiteral("qrc:/arduino.qml"));
    view->show();

    return app.exec();
}
