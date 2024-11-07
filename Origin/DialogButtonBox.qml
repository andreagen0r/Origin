import QtQuick
import QtQuick.Templates as T

T.DialogButtonBox {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          contentWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           contentHeight + topPadding + bottomPadding)

  spacing: 12
  padding: 12
  alignment: Qt.AlignVCenter | Qt.AlignRight
  buttonLayout: DialogButtonBox.GnomeLayout

  delegate: Button {
    flat: true
  }

  contentItem: ListView {
    model: control.contentModel
    spacing: control.spacing
    orientation: ListView.Horizontal
    boundsBehavior: Flickable.StopAtBounds
    snapMode: ListView.SnapToItem
  }

  background: Item {}
}
