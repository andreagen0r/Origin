import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.CheckDelegate {
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

  // keep in sync with CheckBox.qml (the shared indicatorqml was removed for performance reasons)
  indicator: Rectangle {
    x: control.text ? (control.mirrored ? control.leftPadding : control.width - width - control.rightPadding) : control.leftPadding + (control.availableWidth - width) / 2
    y: control.topPadding + (control.availableHeight - height) / 2

    implicitWidth: 18
    implicitHeight: 18

    border.width: 1
    radius: 3

    color: {
      if (!control.enabled || control.checkState === Qt.Unchecked) {
          return "transparent"
      }

      if (control.hovered) {
          return control.down ? internal.downdColor : internal.hoveredColor
      }

      return control.palette.active.accent
    }

    border.color: {
      if (!control.enabled) {
          return control.palette.disabled.text
      }

      if (control.hovered) {
          return control.down ? internal.downdColor : internal.hoveredColor
      }

      if (control.checked) {
          return "transparent"
      }

      return control.palette.active.text
    }

    IconLabel {
      anchors.centerIn: parent
      width: 14
      height: 14
      icon.source: Qt.resolvedUrl("Icons/check-mark.svg")
      icon.color: control.enabled ? control.palette.active.highlightedText : control.palette.disabled.text

      scale: control.checkState === Qt.Checked ? 1 : 0
      Behavior on scale { NumberAnimation { duration: 100 } }
    }

    Rectangle {
      anchors.centerIn: parent
      width: 12
      height: 3
      color: control.palette.active.highlightedText

      scale: control.checkState === Qt.PartiallyChecked ? 1 : 0
      Behavior on scale { NumberAnimation { duration: 100 } }
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
    color: !control.enabled ? control.palette.disabled.text
                            : control.visualFocus ? control.palette.active.accent : control.palette.active.text
  }

  background: Rectangle {
    implicitHeight: 40
    radius: 3
    color: control.enabled ? control.palette.midlight : "transparent"
    opacity: control.highlighted || control.hovered || control.visualFocus ? 0.2 : 0

    Behavior on opacity { NumberAnimation { easing.type: Easing.OutCubic; duration: 450 } }
  }
}
