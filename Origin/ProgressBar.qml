pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Templates as T

T.ProgressBar {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          implicitContentWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           implicitContentHeight + topPadding + bottomPadding)

  background: Rectangle {
    implicitWidth: 200
    implicitHeight: 4
    y: (control.height - height)
    radius: height
    color: control.palette.active.base
  }

  contentItem: Item {
    implicitWidth: 200
    implicitHeight: 4

    Rectangle {
      width: control.visualPosition * parent.width
      height: parent.height
      radius: height
      color: control.palette.active.accent
      visible: !control.indeterminate
    }

    Item {
      id: handler
      anchors.fill: parent
      visible: control.indeterminate
      clip: true

      Row {
        spacing: 20

        Repeater {
          model: control.width / 40 + 1

          Rectangle {
            color: control.palette.active.accent
            width: 20
            height: control.height
            radius: height
          }
        }

        XAnimator on x {
          from: 0
          to: 40
          loops: Animation.Infinite
          running: control.indeterminate
        }
      }
    }
  }
}
