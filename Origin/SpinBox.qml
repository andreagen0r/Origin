import QtQuick
import QtQuick.Templates as T

T.SpinBox {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          contentItem.implicitWidth +
                          up.implicitIndicatorWidth +
                          down.implicitIndicatorWidth )
  implicitHeight: Math.max(implicitContentHeight + topPadding + bottomPadding,
                           implicitBackgroundHeight,
                           up.implicitIndicatorHeight,
                           down.implicitIndicatorHeight)

  spacing: 6
  verticalPadding: 4
  leftPadding: (control.mirrored ? (up.indicator ? up.indicator.width : 0) : (down.indicator ? down.indicator.width : 0))
  rightPadding: (control.mirrored ? (down.indicator ? down.indicator.width : 0) : (up.indicator ? up.indicator.width : 0))

  QtObject {
    id: internal

    readonly property color hoveredColor: Qt.styleHints.colorScheme === Qt.Light ?
                                            Qt.darker( control.palette.active.button, 1.2 )
                                          : Qt.lighter( control.palette.active.button, 1.2 )

    readonly property color downColor: Qt.styleHints.colorScheme === Qt.Light
                                       ? Qt.darker( control.palette.active.button, 1.4 )
                                       : Qt.lighter( control.palette.active.button, 1.4 )

  }

  validator: IntValidator {
    locale: control.locale.name
    bottom: Math.min(control.from, control.to)
    top: Math.max(control.from, control.to)
  }

  contentItem: TextInput {
    horizontalAlignment: Qt.AlignHCenter
    verticalAlignment: Qt.AlignVCenter
    text: control.displayText
    font: control.font
    color: control.enabled ? control.palette.active.text : control.palette.disabled.text
    selectionColor: control.palette.active.highlight
    selectedTextColor: control.palette.active.highlightedText

    cursorDelegate: CursorDelegate { }

    readOnly: !control.editable
    validator: control.validator
    inputMethodHints: control.inputMethodHints
  }

  up.indicator: Rectangle {
    x: control.mirrored ? 0 : parent.width - width
    implicitWidth: 32
    implicitHeight: 28
    topRightRadius: 3
    bottomRightRadius: 3
    color: {
      if ( control.up.hovered && !control.up.pressed ) {
        return internal.hoveredColor
      } else if ( control.up.hovered && control.up.pressed ) {
        return internal.downColor
      }
      return control.palette.active.button
    }

    Rectangle {
      x: (parent.width - width) / 2
      y: (parent.height - height) / 2
      width: Math.min(parent.width / 3, parent.height / 3)
      height: 2
      color: !control.enabled ? control.palette.disabled.buttonText : control.palette.active.buttonText
    }

    Rectangle {
      x: (parent.width - width) / 2
      y: (parent.height - height) / 2
      width: 2
      height: Math.min(parent.width / 3, parent.height / 3)
      color: !control.enabled ? control.palette.disabled.buttonText : control.palette.active.buttonText
    }
  }

  down.indicator: Rectangle {
    x: control.mirrored ? parent.width - width : 0
    implicitWidth: 32
    implicitHeight: 28
    topLeftRadius: 3
    bottomLeftRadius: 3
    color: {
      if ( control.down.hovered && !control.down.pressed ) {
        return internal.hoveredColor
      } else if ( control.down.hovered && control.down.pressed ) {
        return internal.downColor
      }
      return control.palette.active.button
    }

    Rectangle {
      x: (parent.width - width) / 2
      y: (parent.height - height) / 2
      width: parent.width / 3
      height: 2
      color: !control.enabled ? control.palette.disabled.buttonText : control.palette.active.buttonText
    }
  }

  background: Item {
    implicitWidth: 120
    implicitHeight: 28

    Rectangle {
      anchors.centerIn: parent
      width: parent.width - (control.up.implicitIndicatorWidth * 2)
      height: parent.height
      color: control.enabled ? control.palette.active.base : control.palette.disabled.base
      border.width: control.activeFocus ? 1 : 0
      border.color: control.palette.active.accent
    }

    Rectangle {
      anchors.bottom: parent.bottom
      anchors.horizontalCenter: parent.horizontalCenter
      width: parent.width - (control.up.implicitIndicatorWidth * 2)
      height: 1 //control.activeFocus ? 2 : 1
      color: !control.enabled ? control.palette.disabled.accent
                                : control.palette.active.accent
    }
  }
}
