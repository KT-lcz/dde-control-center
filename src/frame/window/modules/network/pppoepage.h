/*
 * Copyright (C) 2011 ~ 2018 Deepin Technology Co., Ltd.
 *
 * Author:     sbw <sbw@sbw.so>
 *             kirigaya <kirigaya@mkacg.com>
 *             Hualet <mr.asianwang@gmail.com>
 *
 * Maintainer: sbw <sbw@sbw.so>
 *             kirigaya <kirigaya@mkacg.com>
 *             Hualet <mr.asianwang@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef PPPOEPAGE_H
#define PPPOEPAGE_H

#include "widgets/contentwidget.h"
#include "connectioneditpage.h"
#include "window/namespace.h"

#include <DListView>

#include <QMap>
#include <QStandardItemModel>
#include <QPointer>

class QVBoxLayout;
class QPushButton;

namespace Dtk {
namespace Widget {
class DFloatingButton;
}
}

namespace dde {
namespace network {
class NetworkModel;
}
}

namespace dcc {
namespace widgets {
    class SettingsGroup;
    class SwitchWidget;
    class LoadingNextPageWidget;
}
}

namespace DCC_NAMESPACE {
namespace network {

class PppoePage : public dcc::ContentWidget
{
    Q_OBJECT
public:
    explicit PppoePage(QWidget *parent = 0);
    ~PppoePage();

    void setModel(dde::network::NetworkModel *model);

Q_SIGNALS:
    void requestNextPage(ContentWidget * const w) const;
    void requestFrameKeepAutoHide(const bool autoHide) const;
    void requestActivateConnection(const QString &devPath, const QString &uuid) const;

private Q_SLOTS:
    void createPPPoEConnection();
    void onConnectionListChanged();
    void onConnectionDetailClicked(const QString &connectionUuid);
    void onPPPoESelected(const QString &connectionUuid);
    void onActiveConnectionChanged(const QList<QJsonObject> &conns);

private:
    dde::network::NetworkModel *m_model;

    DListView *m_lvsettings;
    QStandardItemModel *m_modelSettings;

    DFloatingButton *m_createBtn;
    QPointer<ConnectionEditPage> m_editPage;
    QMap<QString, DStandardItem *> m_items;

    static const int UuidRole = Dtk::UserRole + 1;
};

}

}

#endif // PPPOEPAGE_H
