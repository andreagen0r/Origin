pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Templates as T

T.AbstractMonthGrid {
  id: control

  implicitWidth: Math.max(background ? background.implicitWidth : 0,
                          contentItem.implicitWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(background ? background.implicitHeight : 0,
                           contentItem.implicitHeight + topPadding + bottomPadding)

  spacing: 6

  delegate: Text {
    required property var model

    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    opacity: model.month === control.month ? 1 : 0
    text: model.day
    font: control.font
  }

  contentItem: Grid {
    rows: 6
    columns: 7
    rowSpacing: control.spacing
    columnSpacing: control.spacing

    Repeater {
      model: control.source
      delegate: control.delegate
    }
  }
}
