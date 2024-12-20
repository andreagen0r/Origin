import QtQuick
import QtQuick.Templates as T

T.MenuSeparator {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          implicitContentWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           implicitContentHeight + topPadding + bottomPadding)

  verticalPadding: 6

  contentItem: Rectangle {
    implicitWidth: 200
    implicitHeight: 1
    color: control.palette.inactive.shadow
  }
}
