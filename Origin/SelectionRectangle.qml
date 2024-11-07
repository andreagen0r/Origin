import QtQuick
import QtQuick.Templates as T

T.SelectionRectangle {
  id: control

  topLeftHandle: Handle {}
  bottomRightHandle: Handle {}

  component Handle : Rectangle {
    id: handle

    property Item control: SelectionRectangle.control

    width: 28
    height: width
    radius: width / 2
    color: SelectionRectangle.dragging ? control.palette.light : control.palette.window
    border.width: 1
    border.color: control.enabled ? control.palette.mid : control.palette.midlight
    visible: SelectionRectangle.control.active
  }
}
