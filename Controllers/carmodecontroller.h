#ifndef CARMODECONTROLLER_H
#define CARMODECONTROLLER_H

#include <QObject>

class CarModeController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isClusterModeOn READ isClusterModeOn WRITE setIsClusterModeOn NOTIFY isClusterModeOnChanged)

public:
    explicit CarModeController(QObject *parent = nullptr);
    bool isClusterModeOn() const;

signals:
    void isClusterModeOnChanged(bool isClusterModeOn);

public slots:
    void setIsClusterModeOn(bool isClusterModeOn);

private:
    bool m_isClusterModeOn;
};

#endif // CARMODECONTROLLER_H
