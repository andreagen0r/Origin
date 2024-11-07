import QtQuick
import QtQuick.Templates as T

T.Switch {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          implicitContentWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           implicitContentHeight + topPadding + bottomPadding,
                           implicitIndicatorHeight + topPadding + bottomPadding)

  padding: 6
  spacing: 12

  indicator: SwitchIndicator {
    x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
    y: control.topPadding + (control.availableHeight - height) / 2
    control: control
  }

  contentItem: Label {
    leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
    rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0

    text: control.text
    font: control.font
    elide: Text.ElideRight
    verticalAlignment: Text.AlignVCenter
    color: {
      if ( !control.enabled ) {
        control.palette.disabled.text
      } else if ( control.visualFocus ) {
        control.palette.accent
      } else {
        control.palette.text
      }
    }

  }
}
