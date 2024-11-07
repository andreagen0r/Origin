pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.RoundButton {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          implicitContentWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           implicitContentHeight + topPadding + bottomPadding)

  padding: 4
  leftPadding: availableHeight / 2
  rightPadding: availableHeight + 18
  spacing: 6

  font.pointSize: 8

  icon.width: 8
  icon.height: 8
  icon.color: enabled ? "transparent" : palette.disabled.buttonText

  contentItem: IconLabel {
    spacing: control.spacing
    mirrored: control.mirrored
    display: control.display
    alignment: Text.AlignLeft
    icon: control.icon
    text: control.text
    font: control.font
    state: control.state
    color: control.palette.active.text
  }

  background: Rectangle {
    id: bgBase
    implicitWidth: 90
    implicitHeight: 12
    radius: Math.max(control.availableWidth, control.availableHeight)
    color: control.palette.active.button

    IconLabel {
      readonly property real padding: 2

      x: parent.width - parent.height - padding
      y: (parent.height - height) - ( padding / 2 )
      width: parent.height - padding
      height: width
      display: T.AbstractButton.IconOnly
      icon.width: 16
      icon.height: 16
      icon.source: "qrc:/qt/qml/Origin/Icons/times-circle.svg"
      icon.color: control.palette.active.text
      font: control.font
      color: control.palette.active.text
      scale: control.pressed ? 0.90 : 1
    }
  }
}
