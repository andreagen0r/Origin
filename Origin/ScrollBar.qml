import QtQuick
import QtQuick.Templates as T

T.ScrollBar {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          implicitContentWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           implicitContentHeight + topPadding + bottomPadding)

  bottomInset: 2
  padding: control.interactive ? 2 : 1
  visible: control.policy !== T.ScrollBar.AlwaysOff
  minimumSize: orientation == Qt.Horizontal ? height / width : width / height

  contentItem: Rectangle {
    implicitWidth: control.interactive ? 6 : 4
    implicitHeight: control.interactive ? 6 : 4

    color: !control.enabled ? control.palette.disabled.button
                            : control.palette.active.accent
    opacity: 0.0
    radius: Math.max(width, height) / 2
  }

  background: Rectangle {
    implicitWidth: control.interactive ? 6 : 4
    implicitHeight: control.interactive ? 6 : 4
    color: control.palette.active.button
    opacity: 0.0
    visible: control.interactive
    radius: Math.max(width, height) / 2
  }

  states: State {
    name: "active"
    when: control.policy === T.ScrollBar.AlwaysOn || (control.active && control.size < 1.0)
  }

  transitions: [
    Transition {
      to: "active"
      NumberAnimation { targets: [control.contentItem, control.background]; property: "opacity"; to: 1.0 }
    },
    Transition {
      from: "active"
      SequentialAnimation {
        PropertyAction{ targets: [control.contentItem, control.background]; property: "opacity"; value: 1.0 }
        PauseAnimation { duration: 2450 }
        NumberAnimation { targets: [control.contentItem, control.background]; property: "opacity"; to: 0.0 }
      }
    }
  ]
}
