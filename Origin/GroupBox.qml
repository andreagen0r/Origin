import QtQuick
import QtQuick.Templates as T

T.GroupBox {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          contentWidth + leftPadding + rightPadding,
                          implicitLabelWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           contentHeight + topPadding + bottomPadding)

  spacing: 4
  padding: 12
  topPadding: padding + (implicitLabelWidth > 0 ? implicitLabelHeight + spacing : 0)

  label: Text {
    x: control.leftPadding
    width: control.availableWidth
    text: control.title
    font.pointSize: control.font.pointSize + 2
    font.weight: Font.Medium
    font.letterSpacing: 1.2
    color: control.enabled ? control.palette.active.text : control.palette.inactive.text
    elide: Text.ElideRight
    verticalAlignment: Text.AlignVCenter
  }

  background: Rectangle {
    y: control.topPadding - control.bottomPadding
    width: parent.width
    height: parent.height - control.topPadding + control.bottomPadding
    radius: 5
    color: "transparent"
    border.color: !control.enabled ? control.palette.disabled.mid :
                                     control.focus ? control.palette.active.mid : control.palette.inactive.mid
  }
}
