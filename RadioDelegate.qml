import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.RadioDelegate {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          implicitContentWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           implicitContentHeight + topPadding + bottomPadding,
                           implicitIndicatorHeight + topPadding + bottomPadding)

  padding: 6
  verticalPadding: 6
  spacing: 12

  icon.width: 24
  icon.height: 24
  icon.color: enabled ? "transparent" : palette.disabled.text

  QtObject {
    id: internal

    readonly property color hoveredColor: Qt.styleHints.colorScheme === Qt.Light
                                          ? Qt.darker( control.palette.active.accent, 1.2 )
                                          : Qt.lighter( control.palette.active.accent, 1.2 )

    readonly property color downdColor: Qt.styleHints.colorScheme === Qt.Light
                                        ? Qt.darker( control.palette.active.accent, 1.4 )
                                        : Qt.lighter( control.palette.active.accent, 1.4 )
  }

  // keep in sync with RadioButton.qml (shared RadioIndicator.qml was removed for performance reasons)
  indicator: Rectangle {
    x: control.text ? (control.mirrored ? control.leftPadding : control.width - width - control.rightPadding) : control.leftPadding + (control.availableWidth - width) / 2
    y: control.topPadding + (control.availableHeight - height) / 2
    implicitWidth: 20
    implicitHeight: 20
    radius: width / 2
    color: "transparent"
    border.color: !control.enabled ? control.palette.disabled.text
                                   : ( control.hovered || control.visualFocus ) && !control.down ? internal.hoveredColor
                                                                                                 : control.hovered && control.down ? internal.downdColor
                                                                                                                                   : control.palette.active.accent

    border.width: 1
    scale: control.pressed ? 0.9 : 1

    Behavior on scale { NumberAnimation { duration: 100 } }

    Rectangle {
      anchors.centerIn: parent
      width: 10
      height: 10
      radius: width / 2
      color: parent.border.color
      visible: control.checked || control.down
    }
  }

  contentItem: IconLabel {
    leftPadding: !control.mirrored ? 0 : control.indicator.width + control.spacing
    rightPadding: control.mirrored ? 0 : control.indicator.width + control.spacing

    spacing: control.spacing
    mirrored: control.mirrored
    display: control.display
    alignment: control.display === IconLabel.IconOnly || control.display === IconLabel.TextUnderIcon ? Qt.AlignCenter : Qt.AlignLeft

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
