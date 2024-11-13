import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.ItemDelegate {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          implicitContentWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           implicitContentHeight + topPadding + bottomPadding,
                           implicitIndicatorHeight + topPadding + bottomPadding)

  padding: 6
  spacing: 12

  icon.width: 24
  icon.height: 24
  icon.color: enabled ? "transparent" : palette.disabled.text

  contentItem: IconLabel {
    spacing: control.spacing
    mirrored: control.mirrored
    display: control.display
    alignment: control.display === IconLabel.IconOnly || control.display === IconLabel.TextUnderIcon ? Qt.AlignCenter : Qt.AlignLeft

    icon: control.icon
    text: control.text
    font: control.font
    color: !control.enabled ? control.palette.disabled.text
                            : control.visualFocus ? control.palette.active.accent : control.palette.active.text
  }

  background: Rectangle {
    implicitHeight: 32
    radius: 3
    color: control.enabled ? control.palette.midlight : "transparent"
    opacity: control.highlighted || control.hovered || control.visualFocus ? 0.2 : 0

    Behavior on opacity { NumberAnimation { easing.type: Easing.OutCubic; duration: 450 } }
  }
}
