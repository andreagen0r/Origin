import QtQuick
import QtQuick.Templates as T

T.RadioButton {
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

  // keep in sync with RadioDelegate.qml (shared RadioIndicator.qml was removed for performance reasons)
  indicator: Rectangle {
    x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
    y: control.topPadding + (control.availableHeight - height) / 2
    implicitWidth: 18
    implicitHeight: implicitWidth
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

    Rectangle {
      anchors.centerIn: parent
      z: -1
      width: 32
      height: width
      radius: height / 2

      color: control.enabled ? control.palette.midlight : "transparent"
      opacity: control.hovered || control.visualFocus ? 0.2 : 0

      Behavior on opacity { NumberAnimation { easing.type: Easing.OutCubic; duration: 450 } }
    }
  }

  contentItem: Text {
    leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
    rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0

    text: control.text
    font: control.font
    color: control.enabled ? control.palette.active.text : control.palette.disabled.text
    elide: Text.ElideRight
    verticalAlignment: Text.AlignVCenter
  }
}
