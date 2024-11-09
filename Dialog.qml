pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.Dialog {
  id: control

  property alias icon: idTitle.icon

  implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                          contentWidth + leftPadding + rightPadding,
                          implicitHeaderWidth,
                          implicitFooterWidth)
  implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                           contentHeight + topPadding + bottomPadding
                           + (implicitHeaderHeight > 0 ? implicitHeaderHeight + spacing : 0)
                           + (implicitFooterHeight > 0 ? implicitFooterHeight + spacing : 0))

  padding: 12
  spacing: 0

  enter: Transition {
    // grow_fade_in
    NumberAnimation { property: "scale"; from: 0.9; to: 1.0; easing.type: Easing.OutQuint; duration: 220 }
    NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; easing.type: Easing.OutCubic; duration: 150 }
  }

  exit: Transition {
    // shrink_fade_out
    NumberAnimation { property: "scale"; from: 1.0; to: 0.9; easing.type: Easing.OutQuint; duration: 220 }
    NumberAnimation { property: "opacity"; from: 1.0; to: 0.0; easing.type: Easing.OutCubic; duration: 150 }
  }

  background: Rectangle {
    implicitWidth: 900
    implicitHeight: 600
    radius: control.popupType === Popup.Item ? 5 : 0
    color: control.palette.active.window

    layer.enabled: true
    layer.effect: ElevationEffect {
      elevation: 6
    }
  }

  header: T.Control {
    implicitHeight: contentItem.implicitHeight + topPadding + bottomPadding
    implicitWidth: contentItem.implicitWidth + leftPadding + rightPadding

    horizontalPadding: 12
    verticalPadding: 6
    spacing: 0

    background: Rectangle {
      color: control.palette.active.button
      topLeftRadius: control.popupType === Popup.Item ? 5 : 0
      topRightRadius: topLeftRadius

      Rectangle {
        height: 1
        color: control.palette.active.highlight
        anchors {
          left: parent.left
          right: parent.right
          bottom: parent.bottom
        }
      }
    }

    contentItem: IconLabel {
      id: idTitle
      implicitHeight: 24

      spacing: 12
      alignment: Qt.AlignLeft
      color: control.palette.active.brightText
      text: control.title
      font.pointSize: 20
      font.letterSpacing: 2.0
      icon.width: 36
      icon.height: 36
    }
  }

  footer: DialogButtonBox {
    visible: count > 0
  }

  T.Overlay.modal: Rectangle {
    color: Qt.alpha( control.palette.active.shadow, 0.98)
    Behavior on opacity { NumberAnimation { duration: 150 } }
  }

  T.Overlay.modeless: Item {
    Behavior on opacity { NumberAnimation { duration: 150 } }
  }
}
