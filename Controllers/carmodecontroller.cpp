#include "carmodecontroller.h"

CarModeController::CarModeController(QObject *parent)
    : QObject(parent)
    , m_isClusterModeOn(false)
{
}

bool CarModeController::isClusterModeOn() const
{
    return m_isClusterModeOn;
}

void CarModeController::setIsClusterModeOn(bool isClusterModeOn)
{
    if (m_isClusterModeOn == isClusterModeOn)
        return;

    m_isClusterModeOn = isClusterModeOn;
    emit isClusterModeOnChanged(m_isClusterModeOn);
}
