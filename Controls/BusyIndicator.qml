import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.Material.impl

// FIXME: Criar BusyIndicatorImpl e remover dependência do Material

T.BusyIndicator {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          implicitContentWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           implicitContentHeight + topPadding + bottomPadding)

  padding: 0

  contentItem: Rectangle {
    implicitWidth: 50
    implicitHeight: width
    color: Qt.alpha( control.palette.active.shadow, 0.9)
    radius: implicitHeight / 2
    opacity: control.running ? 1 : 0
    Behavior on opacity { OpacityAnimator { duration: 150 } }

    BusyIndicatorImpl {
      anchors.fill: parent
      anchors.margins: 6
      color: control.palette.active.accent

      running: control.running
      opacity: control.running ? 1 : 0
      Behavior on opacity { OpacityAnimator { duration: 150 } }
    }
  }
}
