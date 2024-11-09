pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Templates as T

T.AbstractWeekNumberColumn {
  id: control

  implicitWidth: Math.max(background ? background.implicitWidth : 0,
                          contentItem.implicitWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(background ? background.implicitHeight : 0,
                           contentItem.implicitHeight + topPadding + bottomPadding)

  spacing: 6
  leftPadding: 6
  rightPadding: 6
  font.bold: true

  delegate: Text {
    required property int weekNumber

    text: weekNumber
    font: control.font
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
  }

  contentItem: Column {
    spacing: control.spacing
    Repeater {
      model: control.source
      delegate: control.delegate
    }
  }
}
