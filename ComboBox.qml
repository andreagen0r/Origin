pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Window
import QtQuick.Controls.impl
import QtQuick.Templates as T

T.ComboBox {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          implicitContentWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           implicitContentHeight + topPadding + bottomPadding,
                           implicitIndicatorHeight + topPadding + bottomPadding)

  topInset: 6
  bottomInset: 6

  leftPadding: padding + (!control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)
  rightPadding: padding + (control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)

  QtObject {
    id: internal

    readonly property color hoveredColor: Qt.styleHints.colorScheme === Qt.Light ?
                                            Qt.darker( control.palette.active.button, 1.2 )
                                          : Qt.lighter( control.palette.active.button, 1.2 )

    readonly property color downColor: Qt.styleHints.colorScheme === Qt.Light
                                       ? Qt.darker( control.palette.active.button, 1.4 )
                                       : Qt.lighter( control.palette.active.button, 1.4 )

    readonly property color hoveredHighlightColor: Qt.styleHints.colorScheme === Qt.Light ?
                                                     Qt.darker( control.palette.active.accent, 1.1 )
                                                   : Qt.lighter( control.palette.active.accent, 1.1 )

    readonly property color downHighlightColor: Qt.styleHints.colorScheme === Qt.Light
                                                ? Qt.darker( control.palette.active.accent, 1.2 )
                                                : Qt.lighter( control.palette.active.accent, 1.2 )
  }

  delegate: MenuItem {
    required property var model
    required property int index

    width: ListView.view.width
    text: model[control.textRole]
    highlighted: control.highlightedIndex === index
    hoverEnabled: control.hoverEnabled
  }

  indicator: ColorImage {
    x: control.mirrored ? control.padding : control.width - width - control.padding
    y: control.topPadding + (control.availableHeight - height) / 2
    color: !control.enabled ? control.palette.disabled.buttonText : control.palette.active.buttonText
    source: Qt.resolvedUrl("Icons/caret-down.svg")
  }

  contentItem: T.TextField {
    padding: 6
    leftPadding: control.editable ? 12 : control.mirrored ? 0 : 12
    rightPadding: control.editable ? 12 : control.mirrored ? 12 : 0

    text: control.editable ? control.editText : control.displayText

    enabled: control.editable
    autoScroll: control.editable
    readOnly: control.down
    inputMethodHints: control.inputMethodHints
    validator: control.validator

    font: control.font
    color: control.enabled ? control.palette.active.text : control.palette.disabled.text
    selectionColor: control.palette.active.highlight
    selectedTextColor: control.palette.active.highlightedText
    verticalAlignment: Text.AlignVCenter

    cursorDelegate: CursorDelegate { }
  }

  background: Rectangle {
    implicitWidth: 120
    implicitHeight: 32
    radius: 3
    border.color: control.flat ? control.palette.active.button: "transparent"
    color: {
      if ( control.flat ) {
        return "transparent"
      }

      if ( control.editable ) {
        return control.palette.active.base
      }

      if ( control.hovered && !control.down ) {
        return internal.hoveredColor
      } else if ( control.hovered && control.down ) {
        return internal.downColor
      }
      return control.palette.active.button
    }

    Rectangle {
      // shadow
      anchors.fill: parent
      z: -1
      color: "transparent"
      layer.enabled: control.enabled && !control.editable && !control.flat
      layer.effect: ElevationEffect {
        elevation: control.down ? 0 : 4
      }
    }

    Rectangle {
      readonly property real margin: 8
      anchors.centerIn: parent
      width: parent.width + margin
      height: parent.height + margin
      radius: (parent as Rectangle)?.radius || 3
      color: "transparent"
      border.width: control.visualFocus ? 1 : 0
      border.color: control.palette.active.midlight
    }

    Rectangle {
      anchors.bottom: parent.bottom
      anchors.horizontalCenter: parent.horizontalCenter
      width: parent.width
      height: 2
      color: control.palette.active.accent
      visible: control.editable
    }
  }

  popup: T.Popup {
    y: control.height + 5 //
    width: control.width
    height: Math.min(contentItem.implicitHeight, control.Window.height - topMargin - bottomMargin)
    transformOrigin: Item.Top

    enter: Transition {
      // grow_fade_in
      NumberAnimation { property: "scale"; from: 0.9; to: 1.0; easing.type: Easing.OutQuint; duration: 250 }
      NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; easing.type: Easing.OutCubic; duration: 150 }
    }

    exit: Transition {
      // shrink_fade_out
      NumberAnimation { property: "scale"; from: 1.0; to: 0.9; easing.type: Easing.OutQuint; duration: 250 }
      NumberAnimation { property: "opacity"; from: 1.0; to: 0.0; easing.type: Easing.OutCubic; duration: 150 }
    }

    contentItem: ListView {
      clip: true
      implicitHeight: contentHeight
      model: control.delegateModel
      currentIndex: control.highlightedIndex
      highlightMoveDuration: 0

      T.ScrollIndicator.vertical: ScrollIndicator { }
    }

    background: Rectangle {
      radius: 3
      color: Qt.lighter( control.palette.active.mid, 1.2 )

      layer.enabled: control.enabled
      layer.effect: ElevationEffect {
        elevation: 6
      }
    }
  }
}
