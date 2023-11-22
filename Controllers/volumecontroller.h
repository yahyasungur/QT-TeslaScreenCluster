#ifndef VOLUMECONTROLLER_H
#define VOLUMECONTROLLER_H

#include <QObject>

class VolumeController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int volumeLevel READ volumeLevel WRITE setVolumeLevel NOTIFY volumeLevelChanged)

public:
    explicit VolumeController(QObject *parent = nullptr);

    int volumeLevel() const;

    Q_INVOKABLE void incrementVolume( const int &value);

public slots:
    void setVolumeLevel(int volumeLevel);

signals:
    void volumeLevelChanged(int volumeLevel);

private:
    int m_volumeLevel;
};

#endif // VOLUMECONTROLLER_H
