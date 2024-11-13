pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Templates as T

T.AbstractDayOfWeekRow {
  id: control

  implicitWidth: Math.max(background ? background.implicitWidth : 0,
                          contentItem.implicitWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(background ? background.implicitHeight : 0,
                           contentItem.implicitHeight + topPadding + bottomPadding)

  spacing: 6
  topPadding: 6
  bottomPadding: 6
  font.bold: true

  delegate: Text {
    required property string shortName

    text: shortName
    font: control.font
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
  }

  contentItem: Row {
    spacing: control.spacing
    Repeater {
      model: control.source
      delegate: control.delegate
    }
  }
}
