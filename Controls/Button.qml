pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.Button {
  id: control

  implicitWidth: Math.max( implicitBackgroundWidth + leftInset + rightInset,
                          implicitContentWidth + leftPadding + rightPadding )
  implicitHeight: Math.max( implicitBackgroundHeight + topInset + bottomInset,
                           implicitContentHeight + topPadding + bottomPadding )

  padding: 6
  horizontalPadding: 12
  spacing: 6

  icon.width: 24
  icon.height: 24
  icon.color: enabled ? "transparent" : palette.disabled.buttonText

  QtObject {
    id: internal

    readonly property color hoveredColor: Qt.styleHints.colorScheme === Qt.Light ?
                                            Qt.darker( control.palette.active.button, 1.1 )
                                          : Qt.lighter( control.palette.active.button, 1.1 )

    readonly property color downColor: Qt.styleHints.colorScheme === Qt.Light
                                       ? Qt.darker( control.palette.active.button, 1.2 )
                                       : Qt.lighter( control.palette.active.button, 1.2 )

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

    if ( flat && highlighted && checkable ) {
      return "flat_highlighted_checkable"
    }

    if ( flat && checkable) {
      return "flat_checkable"
    }

    if ( flat && highlighted ) {
      return "flat_highlighted"
    }

    if ( flat ) {
      return "flat"
    }

    if ( checkable && highlighted ) {
      return "checkable_highlighted"
    }

    if ( highlighted ) {
      return "highlighted"
    }

    if ( checkable ) {
      return "checkable"
    }

    return ""

  }

  states: [

    State {
      name: "flat_highlighted_checkable"

      PropertyChanges {
        bgBase {
          radius: 0
          color: {
            if ( control.checked ) {
              if ( control.down ) {
                return Qt.darker( control.palette.active.base, 1.2 );
              }
              return control.palette.active.base;
            } else {
              if ( control.hovered && !control.down ) {
                return Qt.alpha( control.palette.active.midlight, 0.2 );
              } else if ( control.hovered && control.down ) {
                return Qt.alpha( control.palette.active.midlight, 0.3 );
              }
            }
            return "transparent"
          }
        }
      }

      PropertyChanges { iconAndLabel { color: control.palette.active.accent } }
    },

    State {
      name: "flat_checkable"
      PropertyChanges {
        bgBase {
          radius: 0
          color: {
            if ( control.checked ) {
              if (control.down) {
                return Qt.darker(control.palette.active.base, 1.2);
              }
              return control.palette.active.base;
            } else {
              if (control.hovered && !control.down) {
                return Qt.alpha(control.palette.active.midlight, 0.2);
              } else if (control.hovered && control.down) {
                return Qt.alpha(control.palette.active.midlight, 0.3);
              }
            }
            return "transparent"
          }
        }
      }
    },

    State {
      name: "flat_highlighted"

      PropertyChanges {
        bgBase {
          radius: 0
          color: {
            if ( control.hovered && !control.down ) {
              return Qt.alpha( control.palette.active.midlight, 0.2 )
            } else if ( control.hovered && control.down ) {
              return Qt.alpha( control.palette.active.midlight, 0.3 )
            }

            return "transparent"
          }
        }
      }

      PropertyChanges { iconAndLabel { color: control.palette.active.accent } }
    },

    State {
      name: "flat"

      PropertyChanges {
        bgBase {
          radius: 0
          color: {
            if ( control.hovered && !control.down ) {
              return Qt.alpha( control.palette.active.midlight, 0.2 )
            } else if ( control.hovered && control.down ) {
              return Qt.alpha( control.palette.active.midlight, 0.3 )
            }

            return "transparent"
          }
        }
      }
    },

    State {
      name: "highlighted"

      PropertyChanges {
        bgBase {
          color: {
            if ( control.hovered && !control.down ) {
              return internal.hoveredHighlightColor
            } else if ( control.hovered && control.down ) {
              return internal.downHighlightColor
            }
            return control.palette.active.accent
          }
        }
      }

      PropertyChanges {
        iconAndLabel {
          color: control.palette.active.highlightedText
          icon.color: control.palette.active.highlightedText
        }
      }

      PropertyChanges {
        bgFocus { border.color: control.palette.active.accent }
      }
    },

    State {
      name: "checkable_highlighted"
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
                return internal.hoveredHighlightColor
              } else if ( control.hovered && control.down ) {
                return internal.downHighlightColor
              }
            }
            return control.palette.active.accent
          }
        }
      }

      PropertyChanges {
        iconAndLabel {
          color: control.checked ? control.palette.active.accent : control.palette.active.highlightedText
          icon.color: control.checked ? control.palette.active.accent : control.palette.active.highlightedText
        }
      }

      PropertyChanges {
        bgFocus { border.color: control.palette.active.accent }
      }

    },

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
            return control.palette.active.button
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
    implicitWidth: 100
    implicitHeight: 32
    radius: 3
    color: {
      if ( control.hovered && !control.down ) {
        return internal.hoveredColor
      } else if ( control.hovered && control.down ) {
        return internal.downColor
      }
      return control.palette.active.button
    }

    Rectangle {
      // shadow
      anchors.fill: parent
      z: -1
      color: "transparent"
      layer.enabled: control.enabled && !control.checked && !control.flat
      layer.effect: ElevationEffect {
        elevation: control.down ? 0 : 4
      }
    }

    Rectangle {
      id: bgFocus
      anchors.centerIn: parent
      z: -1
      readonly property int margin: 6
      width: parent.width + margin
      height: parent.height + margin
      radius: ( parent as Rectangle )?.radius || 3
      color: "transparent"
      border.width: control.visualFocus ? 1 : 0
      border.color: control.palette.active.midlight
    }

    Rectangle {
      id: bgHighlightLine
      anchors.bottom: parent.bottom
      x: control.checked ? 0 : parent.width / 2
      width: control.checked ? parent.width : 0
      height: 2
      visible: control.checkable
      color: control.palette.active.accent
      opacity: control.checked ? 1.0 : 0

      bottomLeftRadius: 3
      bottomRightRadius: bottomLeftRadius

      Behavior on width {
        NumberAnimation { duration: 250; easing.type: Easing.OutQuad }
      }

      Behavior on x {
        NumberAnimation { duration: 250; easing.type: Easing.OutQuad }
      }

      Behavior on opacity {
        NumberAnimation { duration: 250; easing.type: Easing.OutQuad }
      }
    }
  }
}
