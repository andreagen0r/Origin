import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.MenuItem {
  id: control

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          implicitContentWidth + leftPadding + rightPadding)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           implicitContentHeight + topPadding + bottomPadding,
                           implicitIndicatorHeight + topPadding + bottomPadding)

  padding: 6
  horizontalPadding: 6
  spacing: 6

  icon.width: 20
  icon.height: 20
  icon.color: !enabled ? palette.disabled.text
                       : highlighted ? palette.active.highlightedText
                                     : palette.active.text

  QtObject {
    id: internal

    readonly property color hoveredColor: Qt.styleHints.colorScheme === Qt.Light
                                          ? Qt.darker( control.palette.active.dark, 1.2 )
                                          : Qt.lighter( control.palette.active.dark, 1.2 )

    readonly property color downdColor: Qt.styleHints.colorScheme === Qt.Light
                                        ? Qt.darker( control.palette.active.dark, 1.4 )
                                        : Qt.lighter( control.palette.active.dark, 1.4 )

    readonly property color hoveredHighlightColor: Qt.styleHints.colorScheme === Qt.Light ?
                                                     Qt.darker( control.palette.active.accent, 1.1 )
                                                   : Qt.lighter( control.palette.active.accent, 1.1 )

    readonly property color downHighlightColor: Qt.styleHints.colorScheme === Qt.Light
                                                ? Qt.darker( control.palette.active.accent, 1.2 )
                                                : Qt.lighter( control.palette.active.accent, 1.2 )
  }

  // indicator: CheckIndicator {
  //     x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
  //     y: control.topPadding + (control.availableHeight - height) / 2
  //     visible: control.checkable
  //     control: control
  //     checkState: control.checked ? Qt.Checked : Qt.Unchecked
  // }

  // indicator: ColorImage {
  //   x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
  //   y: control.topPadding + (control.availableHeight - height) / 2
  //   visible: control.checkable
  //   // control: control
  //   // checkState: control.checked ? Qt.Checked : Qt.Unchecked
  //   source: "qrc:/Origin/Icons/caret-right.svg"
  // }

  indicator: Rectangle {
    x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
    y: control.topPadding + (control.availableHeight - height) / 2

    visible: control.checkable

    implicitWidth: 18
    implicitHeight: implicitWidth


    border.width: 1
    radius: 3

    color: {
      if (!control.enabled) {
        return control.palette.disabled.text;
      }

      if (control.checked || control.highlighted) {
        return control.highlighted
            ? control.palette.active.highlightedText
            : control.palette.active.accent;
      }
      return "transparent"
    }

    border.color: {
      if (!control.enabled) {
        return control.palette.disabled.text;
      }

      if (control.checked || control.highlighted) {
        return control.highlighted
            ? control.palette.active.highlightedText
            : "transparent"
      }
      return control.palette.active.text;
    }

    IconLabel {
      id: checkImage
      anchors.centerIn: parent
      width: 14
      height: 14
      icon.source: "qrc:/qt/qml/Origin/Icons/check-mark.svg"
      icon.color: {
        if (!control.enabled) {
          return control.palette.disabled.text;
        }

        if (control.checked || control.highlighted) {
          return !control.highlighted
              ? control.palette.active.highlightedText
              : control.palette.active.accent;
        }
        return "transparent"
      }

      scale: control.checked ? 1 : 0
      Behavior on scale { NumberAnimation { duration: 100 } }
    }

    // Rectangle {
    //   x: (parent.width - width) / 2
    //   y: (parent.height - height) / 2
    //   width: 12
    //   height: 3
    //   color: control.palette.active.highlightedText

    //   scale: control.checkState === Qt.PartiallyChecked ? 1 : 0
    //   Behavior on scale { NumberAnimation { duration: 100 } }
    // }

    // states: [
    //   State {
    //     name: "checked"
    //     when: control.checkState === Qt.Checked
    //   },
    //   State {
    //     name: "partiallychecked"
    //     when: control.checkState === Qt.PartiallyChecked
    //   }
    // ]

    // transitions: Transition {
    //   SequentialAnimation {
    //     NumberAnimation {
    //       target: control
    //       property: "scale"
    //       // Go down 2 pixels in size.
    //       to: 1 - 2 / control.width
    //       duration: 120
    //     }
    //     NumberAnimation {
    //       target: control
    //       property: "scale"
    //       to: 1
    //       duration: 120
    //     }
    //   }
    // }


  }

  arrow: ColorImage {
    x: control.mirrored ? control.padding : control.width - width - control.padding
    y: control.topPadding + (control.availableHeight - height) / 2

    visible: control.subMenu
    mirror: control.mirrored
    color: !control.enabled ? control.palette.disabled.text
                            : control.highlighted ? control.palette.active.highlightedText
                                                  : control.palette.active.text
    source: "qrc:/qt/qml/Origin/Icons/caret-right.svg"
    width: 20
    height: 20
  }

  contentItem: IconLabel {
    readonly property real arrowPadding: control.subMenu && control.arrow ? control.arrow.width + control.spacing : 0
    readonly property real indicatorPadding: control.checkable && control.indicator ? control.indicator.width + control.spacing : 0
    leftPadding: !control.mirrored ? indicatorPadding : arrowPadding
    rightPadding: control.mirrored ? indicatorPadding : arrowPadding

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
    implicitWidth: 200
    implicitHeight: 32
    radius: 3
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
