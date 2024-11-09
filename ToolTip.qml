import QtQuick
import QtQuick.Templates as T

T.ToolTip {
  id: control

  x: parent ? (parent.width - implicitWidth) / 2 : 0
  y: -implicitHeight - 24

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          contentWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           contentHeight + topPadding + bottomPadding)

  padding: 12

  closePolicy: T.Popup.CloseOnEscape | T.Popup.CloseOnPressOutsideParent | T.Popup.CloseOnReleaseOutsideParent

  enter: Transition {
    // toast_enter
    NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; easing.type: Easing.OutQuad; duration: 250 }
  }

  exit: Transition {
    // toast_exit
    NumberAnimation { property: "opacity"; from: 1.0; to: 0.0; easing.type: Easing.InQuad; duration: 250 }
  }

  contentItem: Text {
    text: control.text
    font: control.font
    wrapMode: Text.Wrap
    color: control.palette.active.toolTipText
  }

  background: Rectangle {
    implicitHeight: 32
    color: control.palette.active.toolTipBase
    opacity: 0.9
    radius: 5
  }
}
