#include "volumecontroller.h"

VolumeController::VolumeController(QObject *parent)
    : QObject(parent)
    , m_volumeLevel(0)
{

}

int VolumeController::volumeLevel() const
{
    return m_volumeLevel;
}

void VolumeController::incrementVolume(const int &value)
{
    if((m_volumeLevel == 0) && value < 0) return;
    if((m_volumeLevel == 3) && value > 0) return;

    int newVolume = m_volumeLevel + value;
    setVolumeLevel (newVolume);
}

void VolumeController::setVolumeLevel(int volumeLevel)
{
    if (m_volumeLevel == volumeLevel)
        return;

    m_volumeLevel = volumeLevel;
    emit volumeLevelChanged(m_volumeLevel);
}
