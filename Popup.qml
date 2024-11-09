pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Templates as T

T.Popup {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          contentWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           contentHeight + topPadding + bottomPadding)

  padding: 12

  enter: Transition {
    // grow_fade_in
    NumberAnimation { property: "scale"; from: 0.9; to: 1.0; easing.type: Easing.OutQuint; duration: 220 }
    NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; easing.type: Easing.OutCubic; duration: 150 }
  }

  exit: Transition {
    // shrink_fade_out
    NumberAnimation { property: "scale"; from: 1.0; to: 0.9; easing.type: Easing.OutQuint; duration: 220 }
    NumberAnimation { property: "opacity"; from: 1.0; to: 0.0; easing.type: Easing.OutCubic; duration: 150 }
  }

  background: Rectangle {
    implicitWidth: 400
    implicitHeight: 300

    radius: 5
    color: control.palette.active.mid

    layer.enabled: true
    layer.effect: ElevationEffect {
      elevation: 6
    }
  }

  T.Overlay.modal: Rectangle {
    color: control.palette.active.shadow
    Behavior on opacity { NumberAnimation { duration: 150 } }
  }

  T.Overlay.modeless: Item {
    Behavior on opacity { NumberAnimation { duration: 150 } }
  }
}
