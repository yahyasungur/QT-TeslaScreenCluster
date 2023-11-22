#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <Controllers/system.h>
#include <Controllers/hvachandler.h>
#include <Controllers/volumecontroller.h>
#include <Controllers/carmodecontroller.h>

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    System m_systemHandler;
    HVACHandler m_driverHVACHandler;
    HVACHandler m_passengerHVACHandler;
    VolumeController m_volumeController;
    CarModeController m_carModeController;

    QQmlApplicationEngine engine;

    QQmlContext * context(engine.rootContext ());
    context->setContextProperty ("systemHandler", &m_systemHandler);
    context->setContextProperty ("driverHVAC", &m_driverHVACHandler);
    context->setContextProperty ("passengerHVAC", &m_passengerHVACHandler);
    context->setContextProperty ("volumeController", &m_volumeController);
    context->setContextProperty ("carModeController", &m_carModeController);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
