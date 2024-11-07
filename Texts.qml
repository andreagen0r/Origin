import QtQuick
import QtQuick.Layouts

import Origin

Frame {
  clip: true

  ListModel {
    id: textModel
    ListElement { name: "Display"; pointSize: 26;  letterSpacing: 4.0 }
    ListElement { name: "Title 1"; pointSize: 22;  letterSpacing: 4.0 }
    ListElement { name: "Title 2"; pointSize: 18;  letterSpacing: 2.0 }
    ListElement { name: "Title 3"; pointSize: 15;  letterSpacing: 1.5 }
    ListElement { name: "Headline"; pointSize: 13;  letterSpacing: 1.8 }
    ListElement { name: "Subheadline"; pointSize: 12;  letterSpacing: 1.2 }
    ListElement { name: "Body"; pointSize: 11;  letterSpacing: 1.0 }
    ListElement { name: "Callout"; pointSize: 10;  letterSpacing: 1.2 }
    ListElement { name: "Footnote"; pointSize: 9;  letterSpacing: 1.8 }
    ListElement { name: "Caption 1"; pointSize: 9;  letterSpacing: 1.8 }
    ListElement { name: "Caption 2"; pointSize: 8;  letterSpacing: 1.8 }
  }

  RowLayout {
    anchors.fill: parent
    spacing: 24

    Item {
      Layout.fillWidth: true
    }

    ColumnLayout {
      Layout.alignment: Qt.AlignHCenter;
      Layout.fillWidth: true
      spacing: 12

      Repeater {
        model: textModel
        delegate: Label {
          required property real pointSize
          required property real letterSpacing
          required property string name
          Layout.fillWidth: true
          renderType: Text.NativeRendering
          renderTypeQuality: Text.VeryHighRenderTypeQuality
          // horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          text: name
          font { pointSize: pointSize;  letterSpacing: letterSpacing }
        }
      }
    }

    ColumnLayout {
      Layout.alignment: Qt.AlignHCenter;
      Layout.fillWidth: true
      spacing: 12

      Repeater {
        model: textModel
        delegate: Label {
          required property real pointSize
          required property real letterSpacing
          Layout.fillWidth: true
          renderType: Text.NativeRendering
          renderTypeQuality: Text.VeryHighRenderTypeQuality
          // horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          text: "Sample text"
          font { pointSize: pointSize;  letterSpacing: letterSpacing }
        }
      }
    }

    ColumnLayout {
      Layout.alignment: Qt.AlignRight
      Layout.fillWidth: true
      spacing: 12

      Repeater {
        model: textModel
        delegate: Label {
          required property real pointSize
          required property real letterSpacing
          Layout.fillWidth: true
          renderType: Text.NativeRendering
          renderTypeQuality: Text.VeryHighRenderTypeQuality
          // horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          text: "Sample text"
          enabled: false
          font { pointSize: pointSize;  letterSpacing: letterSpacing }
        }
      }
    }

    Item {
      Layout.fillWidth: true
    }
  }
}
