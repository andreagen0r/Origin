import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.TextArea {
  id: control

  implicitWidth: Math.max(contentWidth + leftPadding + rightPadding,
                          implicitBackgroundWidth + leftInset + rightInset,
                          placeholder.implicitWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(contentHeight + topPadding + bottomPadding,
                           implicitBackgroundHeight + topInset + bottomInset,
                           placeholder.implicitHeight + 1 + topPadding + bottomPadding)

  padding: 6

  color: enabled ? control.palette.active.text : control.palette.disabled.text
  selectionColor: control.palette.active.highlight
  selectedTextColor: control.palette.active.highlightedText
  placeholderTextColor: enabled ? palette.inactive.placeholderText : palette.disabled.placeholderText
  cursorDelegate: CursorDelegate { }

  PlaceholderText {
    id: placeholder
    x: control.leftPadding
    y: control.topPadding
    width: control.width - (control.leftPadding + control.rightPadding)
    height: control.height - (control.topPadding + control.bottomPadding)
    text: control.placeholderText
    font: control.font
    color: control.placeholderTextColor
    verticalAlignment: control.verticalAlignment
    elide: Text.ElideRight
    renderType: control.renderType
    visible: !control.length && !control.preeditText && (!control.activeFocus || control.horizontalAlignment !== Qt.AlignHCenter)
  }

  background: Rectangle {
    implicitWidth: 120
    color: control.enabled ? control.palette.base : control.palette.disabled.base

    Rectangle {
      width: parent.width
      anchors.bottom: parent.bottom
      visible: control.visible && control.activeFocus
      height:  2
      color: control.palette.active.highlight
    }
  }
}
