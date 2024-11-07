import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.MenuBarItem {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          implicitContentWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           implicitContentHeight + topPadding + bottomPadding,
                           implicitIndicatorHeight + topPadding + bottomPadding)

  padding: 6
  horizontalPadding: 12
  spacing: 6

  icon.width: 20
  icon.height: 20
  icon.color: enabled ? "transparent" : palette.disabled.buttonText

  QtObject {
    id: internal

    readonly property color downHighlightColor: Qt.styleHints.colorScheme === Qt.Light
                                                ? Qt.darker( control.palette.active.accent, 1.2 )
                                                : Qt.lighter( control.palette.active.accent, 1.2 )
  }

  contentItem: IconLabel {
    id: iconAndLabel
    spacing: control.spacing
    mirrored: control.mirrored
    display: control.display
    alignment: Qt.AlignLeft
    icon: control.icon
    text: control.text
    font: control.font
    color: !control.enabled ? control.palette.disabled.text
                            : control.highlighted ? control.palette.active.highlightedText
                            : control.palette.active.text
  }

  background: Rectangle {
    implicitWidth: 40
    implicitHeight: 40
    color: {
      if ( !control.highlighted ) {
        return "transparent"
      }

      if ( control.down ) {
        return internal.downHighlightColor
      }
      return control.palette.active.accent
    }
  }
}
