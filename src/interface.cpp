#include <interface.h>
#include <QTimer>

TimedInterface::TimedInterface()
{
    timer = new QTimer(this);
    timer->setSingleShot(true);
    timer->setInterval(500);
    connect(timer, SIGNAL(timeout()), this, SLOT(processAlarmTriggers()));
    alarm_triggers_changed_connect(this, SLOT(alarmTriggersChanged(Maemo::Timed::Event::Triggers)));
}

void TimedInterface::alarmTriggersChanged(Maemo::Timed::Event::Triggers map)
{
    triggerMap = map;

    // Delay forwarding changed triggers, timed may emit alarm_triggers_changed
    // signals in rapid succession
    timer->start();
}

void TimedInterface::processAlarmTriggers()
{
    emit alarmTriggersChanged(triggerMap);
}

TimedInterface *TimedInterface::instance()
{
    static TimedInterface *timed = 0;
    if (!timed)
        timed = new TimedInterface;
    return timed;
}
