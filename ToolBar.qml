import QtQuick
import QtQuick.Templates as T

T.ToolBar {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          contentWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           contentHeight + topPadding + bottomPadding)

  background: Rectangle {
    implicitHeight: 32
    color: control.palette.active.base
  }
}
