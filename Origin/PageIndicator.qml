import QtQuick
import QtQuick.Templates as T

T.PageIndicator {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          implicitContentWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           implicitContentHeight + topPadding + bottomPadding)

  padding: 6
  spacing: 6

  delegate: Rectangle {
    required property int index

    implicitWidth: 8
    implicitHeight: 8

    radius: width / 2
    color: control.enabled ? control.palette.accent : control.palette.disabled.text

    opacity: index === control.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

    Behavior on opacity { OpacityAnimator { duration: 100 } }
  }

  contentItem: Row {
    spacing: control.spacing

    Repeater {
      model: control.count
      delegate: control.delegate
    }
  }
}
