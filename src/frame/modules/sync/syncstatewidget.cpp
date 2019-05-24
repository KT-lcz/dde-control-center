#include "syncstatewidget.h"
#include "syncstateicon.h"
#include "widgets/settingsgroup.h"
#include "widgets/translucentframe.h"

#include <QDebug>
#include <QVBoxLayout>
#include <DHiDPIHelper>
#include <QDateTime>

DWIDGET_USE_NAMESPACE

using namespace dcc;
using namespace dcc::sync;
using namespace dcc::widgets;

SyncStateWidget::SyncStateWidget(QWidget *parent)
    : ContentWidget(parent)
    , m_syncIcon(new SyncStateIcon)
    , m_syncStateLbl(new QLabel)
    , m_lastSyncTimeLbl(new QLabel)
    , m_logoutBtn(new QPushButton)
{
    m_syncIcon->setPixmap(DHiDPIHelper::loadNxPixmap(":/sync/themes/dark/cloud.svg"));
    m_syncStateLbl->setText(tr("Syncing"));
    m_logoutBtn->setText(tr("Logout"));
    m_logoutBtn->setObjectName("LogoutButton");

    QVBoxLayout* layout = new QVBoxLayout;
    layout->setMargin(0);
    layout->setSpacing(0);

    QVBoxLayout* syncStateLayout = new QVBoxLayout;
    syncStateLayout->setSpacing(10);

    syncStateLayout->addWidget(m_syncIcon, 0, Qt::AlignHCenter);
    syncStateLayout->addWidget(m_syncStateLbl, 0, Qt::AlignHCenter);
    syncStateLayout->addWidget(m_lastSyncTimeLbl, 0, Qt::AlignHCenter);

    SettingsGroup* syncStateGrp = new SettingsGroup;
    SettingsItem* syncStateItem = new SettingsItem;
    syncStateItem->setLayout(syncStateLayout);
    syncStateGrp->appendItem(syncStateItem);

    layout->addWidget(syncStateGrp);
    layout->addSpacing(10);

    SettingsGroup* autoSyncGrp = new SettingsGroup;
    m_autoSync = new SwitchWidget(tr("Auto Sync"));
    autoSyncGrp->appendItem(m_autoSync);
    layout->addWidget(autoSyncGrp);
    layout->addSpacing(10);

    m_tips = new TipsLabel;
    m_tips->setWordWrap(true);
    m_tips->setText(tr("Switch it on to sync part of the settings for Control Center, Launcher and Dock automatically."));
    layout->addWidget(m_tips);
    layout->addSpacing(10);

    connect(m_autoSync, &SwitchWidget::checkedChanged, this, &SyncStateWidget::requestEnableSync);

    QMap<SyncModel::SyncType, QString> moduleTs{
        { SyncModel::SyncType::Network, tr("Network Settings") },
        { SyncModel::SyncType::Sound, tr("Sound Settings") },
        { SyncModel::SyncType::Mouse, tr("Mouse Settings") },
        { SyncModel::SyncType::Update, tr("Update Settings") },
        { SyncModel::SyncType::Dock, tr("Dock") },
        { SyncModel::SyncType::Launcher, tr("Launcher") },
        { SyncModel::SyncType::Wallpaper, tr("Wallpaper") },
        { SyncModel::SyncType::Theme, tr("Theme") },
        { SyncModel::SyncType::Power, tr("Power Settings") },
        { SyncModel::SyncType::Corner, tr("Corner Settings") }
    };

    m_moduleGrp = new SettingsGroup;
    QMap<SyncModel::SyncType, QString> moduleMap = m_model->moduleMap();
    for (auto it = moduleMap.cbegin(); it != moduleMap.cend(); ++it) {
        SwitchWidget* module = new SwitchWidget;
        module->setTitle(moduleTs[it.key()]);
        m_syncModuleMap[module] = it.key();
        m_moduleGrp->appendItem(module);
        connect(module, &SwitchWidget::checkedChanged, this, &SyncStateWidget::onModuleItemSwitched);
    }

    layout->addWidget(m_moduleGrp);

    layout->addSpacing(10);
    layout->addWidget(m_logoutBtn);

    layout->addStretch();

    TranslucentFrame* frame = new TranslucentFrame;
    frame->setLayout(layout);

    setContent(frame);

    m_syncStateLbl->hide();
    m_lastSyncTimeLbl->hide();

    connect(m_logoutBtn, &QPushButton::clicked, this, &SyncStateWidget::requestLogout);
}

void SyncStateWidget::setModel(const SyncModel * const model)
{
    m_model = model;

    connect(model, &SyncModel::syncStateChanged, this, &SyncStateWidget::onStateChanged);
    connect(model, &SyncModel::lastSyncTimeChanged, this, &SyncStateWidget::onLastSyncTimeChanged);
    connect(model, &SyncModel::moduleSyncStateChanged, this, &SyncStateWidget::onModuleStateChanged);
    connect(model, &SyncModel::enableSyncChanged, this, &SyncStateWidget::onAutoSyncChanged);
    connect(model, &SyncModel::userInfoChanged, this, [=] (const QVariantMap& info) {
        if (info["Username"].toString().isEmpty()) {
            Q_EMIT back();
        }
    });

    onStateChanged(model->syncState());
    onLastSyncTimeChanged(model->lastSyncTime());
    onAutoSyncChanged(model->enableSync());

    setTitle(model->userinfo()["Username"].toString());

    std::map<SyncModel::SyncType, bool> moduleState = m_model->moduleSyncState().toStdMap();
    for (auto it = moduleState.cbegin(); it != moduleState.cend(); ++it) {
        onModuleStateChanged(*it);
    };
}

void SyncStateWidget::onStateChanged(const std::pair<qint32, QString> &state)
{
    if (!SyncModel::isSyncStateValid(state)) {
        return;
    }

    SyncModel::SyncState syncState;

    do {
        // check is sync succeed
        if (SyncModel::isSyncSucceed(state)) {
            syncState = SyncModel::SyncState::Succeed;
            break;
        }

        // check is syncing
        if (SyncModel::isSyncing(state)) {
            syncState = SyncModel::SyncState::Syncing;
            break;
        }

        // check is sync faild
        if (SyncModel::isSyncFailed(state)) {
            syncState = SyncModel::SyncState::Failed;
            break;
        }

        Q_UNREACHABLE();

    } while (false);

    switch (syncState) {
        case SyncModel::SyncState::Succeed:
            m_lastSyncTimeLbl->show();
            m_syncStateLbl->hide();
            m_syncIcon->setRotatePixmap(DHiDPIHelper::loadNxPixmap(":/sync/themes/dark/sync_ok.svg"));
            m_syncIcon->stop();
            break;
        case SyncModel::SyncState::Syncing:
            m_syncStateLbl->show();
            m_lastSyncTimeLbl->hide();
            m_syncIcon->setRotatePixmap(DHiDPIHelper::loadNxPixmap(":/sync/themes/dark/syncing@2x.svg"));
            m_syncIcon->play();
            break;
        case SyncModel::SyncState::Failed:
            m_lastSyncTimeLbl->show();
            m_syncStateLbl->hide();
            m_syncIcon->setRotatePixmap(QPixmap());
            m_syncIcon->stop();
            break;
    }
}

void SyncStateWidget::onLastSyncTimeChanged(qlonglong lastSyncTime)
{
    m_lastSyncTimeLbl->setText(
        tr("Last Sync: %1")
            .arg(QDateTime::fromMSecsSinceEpoch(lastSyncTime * 1000)
                     .toString(tr("yyyy-MM-dd hh:mm"))));
}

void SyncStateWidget::onModuleStateChanged(std::pair<SyncModel::SyncType, bool> state)
{
    SwitchWidget* widget = m_syncModuleMap.key(state.first);
    Q_ASSERT(widget);

    widget->setChecked(state.second);
}

void SyncStateWidget::onModuleItemSwitched(const bool checked)
{
    SwitchWidget* widget = qobject_cast<SwitchWidget*>(sender());
    Q_ASSERT(widget);

    Q_EMIT requestSetModuleState(std::pair<SyncModel::SyncType, bool>(m_syncModuleMap[widget], checked));
}

void SyncStateWidget::onAutoSyncChanged(bool autoSync)
{
    m_tips->setVisible(!autoSync);
    m_moduleGrp->setVisible(autoSync);
    m_autoSync->setChecked(autoSync);
}
