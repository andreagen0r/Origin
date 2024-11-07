import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.SwitchDelegate {
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

  indicator: SwitchIndicator {
    x: control.text ? (control.mirrored ? control.leftPadding : control.width - width - control.rightPadding) : control.leftPadding + (control.availableWidth - width) / 2
    y: control.topPadding + (control.availableHeight - height) / 2
    control: control
  }

  contentItem: IconLabel {
    leftPadding: !control.mirrored ? 0 : control.indicator.width + control.spacing
    rightPadding: control.mirrored ? 0 : control.indicator.width + control.spacing

    spacing: control.spacing
    mirrored: control.mirrored
    display: control.display
    alignment: ( control.display === IconLabel.IconOnly ) || ( control.display === IconLabel.TextUnderIcon )
               ? Qt.AlignCenter : Qt.AlignLeft

    icon: control.icon
    text: control.text
    font: control.font
    color: control.enabled ? control.palette.inactive.text : control.palette.disabled.text
  }

  background: Rectangle {
    implicitHeight: 40
    radius: 3
    color: control.enabled ? control.palette.midlight : "transparent"
    opacity: control.highlighted || control.hovered || control.visualFocus ? 0.2 : 0

    Behavior on opacity { NumberAnimation { easing.type: Easing.OutCubic; duration: 450 } }
  }
}
