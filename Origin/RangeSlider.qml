import QtQuick
import QtQuick.Templates as T

T.RangeSlider {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          first.implicitHandleWidth + leftPadding + rightPadding,
                          second.implicitHandleWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           first.implicitHandleHeight + topPadding + bottomPadding,
                           second.implicitHandleHeight + topPadding + bottomPadding)

  padding: 6

  first.handle: SliderHandle {
    x: control.leftPadding + (control.horizontal ? control.first.visualPosition * (control.availableWidth - width) : (control.availableWidth - width) / 2)
    y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : control.first.visualPosition * (control.availableHeight - height))
    value: control.first.value
    handleHasFocus: activeFocus
    handlePressed: control.first.pressed
    handleHovered: control.first.hovered
  }

  second.handle: SliderHandle {
    x: control.leftPadding + (control.horizontal ? control.second.visualPosition * (control.availableWidth - width) : (control.availableWidth - width) / 2)
    y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : control.second.visualPosition * (control.availableHeight - height))
    value: control.second.value
    handleHasFocus: activeFocus
    handlePressed: control.second.pressed
    handleHovered: control.second.hovered
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
      x: control.horizontal ? control.first.position * parent.width : 0
      y: control.horizontal ? 0 : control.second.visualPosition * parent.height
      width: control.horizontal ? control.second.position * parent.width - control.first.position * parent.width : 2
      height: control.horizontal ? 2 : control.second.position * parent.height - control.first.position * parent.height
      radius: height

      color: control.enabled ? control.palette.active.accent : control.palette.disabled.mid
    }
  }
}
