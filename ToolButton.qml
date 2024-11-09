import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.ToolButton {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          implicitContentWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           implicitContentHeight + topPadding + bottomPadding)

  padding: 6
  horizontalPadding: 12
  spacing: 6

  icon.width: 24
  icon.height: 24
  icon.color: enabled ? "transparent" : palette.disabled.buttonText

  QtObject {
    id: internal

    readonly property color hoveredColor: Qt.styleHints.colorScheme === Qt.Light ?
                                            Qt.darker( control.palette.active.window, 1.1 )
                                          : Qt.lighter( control.palette.active.window, 1.1 )

    readonly property color downColor: Qt.styleHints.colorScheme === Qt.Light
                                       ? Qt.darker( control.palette.active.window, 1.2 )
                                       : Qt.lighter( control.palette.active.window, 1.2 )

    readonly property color hoveredHighlightColor: Qt.styleHints.colorScheme === Qt.Light ?
                                                     Qt.darker( control.palette.active.accent, 1.1 )
                                                   : Qt.lighter( control.palette.active.accent, 1.1 )

    readonly property color downHighlightColor: Qt.styleHints.colorScheme === Qt.Light
                                                ? Qt.darker( control.palette.active.accent, 1.2 )
                                                : Qt.lighter( control.palette.active.accent, 1.2 )
  }

  state: {

    if ( !enabled ) {
      return "disabled"
    }

    if ( checkable ) {
      return "checkable"
    }

    return ""

  }

  states: [

    State {
      name: "checkable"
      PropertyChanges {
        bgBase {
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
            return control.palette.active.window
          }
        }
      }
    },

    State {
      name: "disabled"
      PropertyChanges {
        bgBase { color: control.palette.disabled.button }
        iconAndLabel { color: control.palette.disabled.buttonText }
      }
    }

  ]

  contentItem: IconLabel {
    id: iconAndLabel
    spacing: control.spacing
    mirrored: control.mirrored
    display: control.display
    icon: control.icon
    text: control.text
    font: control.font
    state: control.state
    color: {
      if (control.down) {
        return control.palette.active.brightText
      }

      return control.palette.active.buttonText
    }
    scale: control.pressed ? 0.95 : 1
  }

  background: Rectangle {
    id: bgBase
    implicitWidth: 32
    implicitHeight: 32
    color: {
      if ( control.hovered && !control.down ) {
        return internal.hoveredColor
      } else if ( control.hovered && control.down ) {
        return internal.downColor
      }
      return control.palette.active.window
    }

    Rectangle {
      anchors.bottom: parent.bottom
      x: control.checked ? 0 : parent.width / 2
      width: control.checked ? parent.width : 0
      height: 2
      color: control.palette.active.accent
      opacity: control.checked ? 1 : 0

      Behavior on width {
        NumberAnimation {duration: 150; easing.type: Easing.OutQuad  }
      }

      Behavior on x {
        NumberAnimation {duration: 150; easing.type: Easing.OutQuad }
      }

      Behavior on opacity {
        NumberAnimation {duration: 150; easing.type: Easing.OutQuad }
      }
    }
  }
}
