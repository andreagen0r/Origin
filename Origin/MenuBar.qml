import QtQuick
import QtQuick.Templates as T

T.MenuBar {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          contentWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           contentHeight + topPadding + bottomPadding)

  delegate: MenuBarItem { }

  contentItem: Row {
    spacing: control.spacing

    Repeater {
      model: control.contentModel
      height: parent.height
    }
  }

  background: Rectangle {
    implicitHeight: 32
    color: control.palette.active.window
  }
}
