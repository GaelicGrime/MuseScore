/*
 * SPDX-License-Identifier: GPL-3.0-only
 * MuseScore-CLA-applies
 *
 * MuseScore
 * Music Composition & Notation
 *
 * Copyright (C) 2021 MuseScore BVBA and others
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
import QtQuick 2.15

import MuseScore.Ui 1.0
import MuseScore.UiComponents 1.0

BaseSection {
    id: root

    title: qsTrc("appshell", "Automatic update check")

    property bool isAppUpdatable: true
    property alias needCheckForNewAppVersion: needCheckBox.checked
    property var museScorePrivacyPolicyUrl: null

    signal needCheckForNewAppVersionChangeRequested(bool check)

    CheckBox {
        id: needCheckBox
        width: parent.width

        text: qsTrc("appshell", "Check to see if a new version of MuseScore is available")

        visible: root.isAppUpdatable

        navigation.name: "NeedCheckBox"
        navigation.panel: root.navigation
        navigation.row: 0

        onClicked: {
            root.needCheckForNewAppVersionChangeRequested(!checked)
        }
    }

    StyledTextLabel {
        width: parent.width
        text: {
            var message = qsTrc("appshell", "Update checking requires network access. In order to protect your privacy, MuseScore \
                          does not store any personal information. See our %1 for more info.")
            var museScorePrivacyPolicyUrl = root.museScorePrivacyPolicyUrl
            return message
            .arg("<a href='" + museScorePrivacyPolicyUrl.url + "'>" + museScorePrivacyPolicyUrl.displayName + "</a>")
            .replace("\n", "<br>")
        }
        horizontalAlignment: Qt.AlignLeft
        wrapMode: Text.WordWrap
        maximumLineCount: 3
    }
}
