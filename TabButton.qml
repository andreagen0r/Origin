import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.TabButton {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          implicitContentWidth + leftPadding + rightPadding)

  implicitHeight: Math.max(implicitBackgroundHeight + leftInset + rightInset,
                           implicitContentHeight + topPadding + bottomPadding)

  spacing: display === AbstractButton.TextUnderIcon ? 6 : 12
  verticalPadding: 2
  horizontalPadding: 12

  icon.width: 24
  icon.height: 24
  icon.color: enabled ? "transparent" : palette.disabled.buttonText

  contentItem: IconLabel {
    id: iconAndLabel
    spacing: control.spacing
    mirrored: control.mirrored
    display: control.display
    icon: control.icon
    text: control.text
    font: control.font
    state: control.state
    color: control.palette.active.text
  }

  background: Rectangle {
    implicitWidth: 120
    implicitHeight: 32
    color: {
      if ( control.checked ) {
        return control.palette.active.base;
      } else {
        if ( control.hovered && !control.down ) {
          return Qt.styleHints.colorScheme === Qt.Light ?
                Qt.darker( control.palette.active.button, 1.2 )
              : Qt.lighter( control.palette.active.button, 1.2 )
        }
      }
      return control.palette.active.button
    }
  }
}
