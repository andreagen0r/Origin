import QtQuick

Item {
  id: indicatorControl
  implicitWidth: 48
  implicitHeight: 28

  required property Item control

  QtObject {
    id: internal

    readonly property color hoveredColor: Qt.styleHints.colorScheme === Qt.Light ?
                                            Qt.darker( control.palette.active.button, 1.2 )
                                          : Qt.lighter( control.palette.active.button, 1.2 )

    readonly property color downColor: Qt.styleHints.colorScheme === Qt.Light
                                       ? Qt.darker( control.palette.active.button, 1.4 )
                                       : Qt.lighter( control.palette.active.button, 1.4 )

    readonly property color hoveredHighlightColor: Qt.styleHints.colorScheme === Qt.Light ?
                                                     Qt.darker( control.palette.active.accent, 1.1 )
                                                   : Qt.lighter( control.palette.active.accent, 1.1 )

    readonly property color downHighlightColor: Qt.styleHints.colorScheme === Qt.Light
                                                ? Qt.darker( control.palette.active.accent, 1.2 )
                                                : Qt.lighter( control.palette.active.accent, 1.2 )
  }

  Rectangle {
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenter: parent.horizontalCenter

    width: parent.width
    height: parent.height
    radius: height / 2
    color: {
      if (!indicatorControl.control.enabled) {
        return indicatorControl.control.palette.disabled.mid
      }

      if ( !indicatorControl.control.checked ) {
        if ( indicatorControl.control.down ) {
          return Qt.darker( indicatorControl.control.palette.active.base, 1.2 )
        }
        return indicatorControl.control.palette.active.base
      } else {
        if ( indicatorControl.control.hovered && !indicatorControl.control.down ) {
          return internal.hoveredHighlightColor
        } else if ( indicatorControl.control.hovered && control.down ) {
          return internal.downHighlightColor
        }
      }
      return indicatorControl.control.palette.active.accent
    }

    Rectangle {
      readonly property int padding: 8
      anchors.verticalCenter: parent.verticalCenter
      anchors.horizontalCenter: parent.horizontalCenter
      width: parent.width + padding
      height: parent.height + padding
      radius: height / 2
      color: "transparent"
      border.width: 1
      border.color: indicatorControl.control.visualFocus ? indicatorControl.control.palette.inactive.highlight : "transparent"
    }
  }

  Rectangle {
    readonly property int padding: 3
    x: Math.max(
         padding, Math.min(
           parent.width - (width + padding),
           indicatorControl.control.visualPosition * parent.width - (width / 2)))
    y: (parent.height - height) / 2
    width: indicatorControl.height - (padding * 2)
    height: width
    radius: width / 2
    color: !indicatorControl.control.enabled ? indicatorControl.control.palette.disabled.midlight
                                             : indicatorControl.control.checked ? indicatorControl.control.palette.active.mid
                                                                                : indicatorControl.control.palette.active.button
    scale: indicatorControl.control.pressed ? 0.9 : 1

    Behavior on scale { SmoothedAnimation { duration: 250 } }
    Behavior on x { SmoothedAnimation { duration: 250 } }
  }
}
