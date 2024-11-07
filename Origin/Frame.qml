import QtQuick
import QtQuick.Templates as T

T.Frame {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          contentWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           contentHeight + topPadding + bottomPadding)

  padding: 12

  background: Rectangle {
    radius: 5
    color: "transparent"
    border.color: !control.enabled ? control.palette.disabled.mid :
                                     control.focus ? control.palette.active.mid : control.palette.inactive.mid
  }
}
