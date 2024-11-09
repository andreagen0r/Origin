import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.CheckBox {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          implicitContentWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           implicitContentHeight + topPadding + bottomPadding,
                           implicitIndicatorHeight + topPadding + bottomPadding)

  spacing: 8
  padding: 8
  verticalPadding: padding + 1

  QtObject {
    id: internal

    readonly property color hoveredColor: Qt.styleHints.colorScheme === Qt.Light
                                          ? Qt.darker( control.palette.active.accent, 1.2 )
                                          : Qt.lighter( control.palette.active.accent, 1.2 )

    readonly property color downdColor: Qt.styleHints.colorScheme === Qt.Light
                                        ? Qt.darker( control.palette.active.accent, 1.4 )
                                        : Qt.lighter( control.palette.active.accent, 1.4 )
  }

  // keep in sync with CheckDelegate.qml (the shared indicatorqml was removed for performance reasons)
  indicator: Rectangle {
    x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
    y: control.topPadding + (control.availableHeight - height) / 2

    implicitWidth: 18
    implicitHeight: 18

    border.width: 1
    radius: 3

    color: {
      if ( !control.enabled || control.checkState === Qt.Unchecked ) {
          return "transparent"
      }

      if ( control.hovered ) {
          return control.down ? internal.downdColor : internal.hoveredColor
      }

      return control.palette.active.accent
    }

    border.color: {
      if ( !control.enabled ) {
          return control.palette.disabled.text
      }

      if ( control.hovered ) {
          return control.down ? internal.downdColor : internal.hoveredColor
      }

      if ( control.checkState !== Qt.Unchecked ) {
          return "transparent"
      }

      return control.palette.active.text
    }

    Rectangle {
      readonly property real mRadius: (parent as Rectangle)?.radius || 0
      z: -1
      anchors.centerIn: parent
      width: parent.width + control.padding
      height: width
      radius: mRadius

      color: control.enabled ? control.palette.midlight : "transparent"
      opacity: control.hovered || control.visualFocus ? 0.2 : 0

      Behavior on opacity { NumberAnimation { easing.type: Easing.OutCubic; duration: 450 } }
    }

    IconLabel {
      anchors.centerIn: parent
      width: 14
      height: 14
      icon.source: "qrc:/qt/qml/Origin/Icons/check-mark.svg"
      icon.color: control.enabled ? control.palette.active.highlightedText : control.palette.disabled.text

      scale: control.checkState === Qt.Checked ? 1 : 0
      Behavior on scale { NumberAnimation { duration: 100 } }
    }

    Rectangle {
      x: (parent.width - width) / 2
      y: (parent.height - height) / 2
      width: 12
      height: 3
      color: control.palette.active.highlightedText

      scale: control.checkState === Qt.PartiallyChecked ? 1 : 0
      Behavior on scale { NumberAnimation { duration: 100 } }
    }
  }

  contentItem: Text {
    leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
    rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0

    text: control.text
    font: control.font
    color: !control.enabled ? control.palette.disabled.text
                            : control.visualFocus ? control.palette.active.accent : control.palette.active.text
    elide: Text.ElideRight
    verticalAlignment: Text.AlignVCenter
  }
}
