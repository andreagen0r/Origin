pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.DelayButton {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          implicitContentWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           implicitContentHeight + topPadding + bottomPadding)

  padding: 6
  horizontalPadding: 12
  spacing: 6

  transition: Transition {
    NumberAnimation {
      duration: control.delay * (control.pressed ? 1.0 - control.progress : 0.3 * control.progress)
    }
  }

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

  contentItem: IconLabel {
    id: iconAndLabel
    spacing: control.spacing
    mirrored: control.mirrored
    display: control.display
    icon: control.icon
    text: control.text
    font: control.font
    state: control.state
    color: control.palette.active.text
    scale: control.pressed ? 0.95 : 1
  }

  background: Rectangle {
    implicitWidth: 100
    implicitHeight: 32
    radius: 3
    color: {
      if ( control.checked ) {
        if ( control.down ) {
          return Qt.darker( control.palette.active.base, 1.2 );
        }
        return control.palette.active.base;
      } else {
        if ( control.hovered && !control.down ) {
          return internal.hoveredColor
        } else if ( control.hovered && control.down ) {
          return internal.downColor
        }
      }
      return control.palette.active.button
    }

    layer.enabled: control.enabled && !control.checked
    layer.effect: ElevationEffect {
      elevation: control.down ? 0 : 4
    }

    PaddedRectangle {
      anchors.bottom: parent.bottom
      anchors.horizontalCenter: parent.horizontalCenter
      width: parent.width - ((parent as Rectangle)?.radius || 3) * 2
      height: 2
      clip: true
      color: control.checked && control.enabled ? control.palette.active.accent : "transparent"

      PaddedRectangle {
        width: parent.width * control.progress
        height: 2
        topPadding: -2
        rightPadding: Math.max(-2, width - parent.width)
        clip: true
        color: control.palette.active.accent
      }
    }
  }
}
