pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Templates as T

T.TabBar {
  id: control

  implicitWidth: contentWidth + leftPadding + rightPadding
  implicitHeight: contentHeight + topPadding + bottomPadding

  spacing: 1

  contentItem: ListView {
    model: control.contentModel
    currentIndex: control.currentIndex
    clip: true

    spacing: control.spacing
    orientation: ListView.Horizontal
    boundsBehavior: Flickable.StopAtBounds
    flickableDirection: Flickable.AutoFlickIfNeeded
    snapMode: ListView.SnapToItem

    highlightMoveDuration: 250
    highlightResizeDuration: 0
    highlightFollowsCurrentItem: true
    highlightRangeMode: ListView.ApplyRange
    preferredHighlightBegin: 48
    preferredHighlightEnd: width - 48

    highlight: Item {
      z: 2
      Rectangle {
        id: idHighlight
        height: 2
        width: parent.width
        y: control.position === T.TabBar.Footer ? 0 : parent.height - height
        color: control.palette.active.accent
      }
    }
  }

  background: Rectangle {
    color: control.palette.active.shadow
  }
}
