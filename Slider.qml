import QtQuick
import QtQuick.Templates as T

T.Slider {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          implicitHandleWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           implicitHandleHeight + topPadding + bottomPadding)

  padding: 6

  handle: SliderHandle {
    x: control.leftPadding + (control.horizontal ? control.visualPosition * (control.availableWidth - width) : (control.availableWidth - width) / 2)
    y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : control.visualPosition * (control.availableHeight - height))
    value: control.value
    handleHasFocus: control.visualFocus
    handlePressed: control.pressed
    handleHovered: control.hovered
  }

  background: Rectangle {
    x: control.leftPadding + (control.horizontal ? 0 : (control.availableWidth - width) / 2)
    y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : 0)
    implicitWidth: control.horizontal ? 200 : 32
    implicitHeight: control.horizontal ? 32 : 200
    width: control.horizontal ? control.availableWidth : 2
    height: control.horizontal ? 2 : control.availableHeight
    color: control.enabled ? control.palette.active.base : control.palette.disabled.base
    scale: control.horizontal && control.mirrored ? -1 : 1
    radius: height

    Rectangle {
      x: control.horizontal ? 0 : (parent.width - width) / 2
      y: control.horizontal ? (parent.height - height) / 2 : control.visualPosition * parent.height
      width: control.horizontal ? control.position * parent.width : 2
      height: control.horizontal ? 2 : control.position * parent.height
      radius: height
      color: control.enabled ? control.palette.active.accent : control.palette.disabled.mid
    }
  }
}
