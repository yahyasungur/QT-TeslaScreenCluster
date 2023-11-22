#include "hvachandler.h"

HVACHandler::HVACHandler(QObject *parent)
    : QObject(parent)
    , m_targetTemperature(28)
{

}

int HVACHandler::targetTemperature() const
{
    return m_targetTemperature;
}

void HVACHandler::incrementTargetTemperature(const int &value)
{
    int newTargetTemperature = m_targetTemperature + value;
    setTargetTemperature (newTargetTemperature);
}

void HVACHandler::setTargetTemperature(int targetTemperature)
{
    if (m_targetTemperature == targetTemperature)
        return;

    m_targetTemperature = targetTemperature;
    emit targetTemperatureChanged(m_targetTemperature);
}
