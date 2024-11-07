import QtQuick
import QtQuick.Layouts
import Origin
import Origin.Extra

Page {
  title: qsTr("Page 3")

  RowLayout {
    // anchors.fill: parent

          Repeater {
            model: [
              qsTr("Name"),
              qsTr("Date Time"),
        qsTr("Counter Number ####"),
        qsTr("Custom Template")
            ]
            delegate: Tag {
              required property string modelData
              text: modelData
            }
          }

      }

  // GroupBox {
  //   id: dials
  //   title: "Dial"
  //   Layout.fillWidth: true
  //   Layout.fillHeight: true
  //   Layout.preferredHeight: 50
  //   Layout.preferredWidth: 50

  //   GridLayout {
  //     anchors.fill: parent
  //     columns: 3
  //     Label { Layout.fillWidth: true; text:"Circular"; horizontalAlignment: Text.AlignHCenter}
  //     Label { Layout.fillWidth: true; text:"Horizontal"; horizontalAlignment: Text.AlignHCenter}
  //     Label { Layout.fillWidth: true; text:"Vertical"; horizontalAlignment: Text.AlignHCenter}
  //     Dial { Layout.alignment: Qt.AlignHCenter; id: dial; value: 0.3 }
  //     Dial { Layout.alignment: Qt.AlignHCenter; inputMode: Dial.Horizontal}
  //     Dial { Layout.alignment: Qt.AlignHCenter; inputMode: Dial.Vertical}
  //   }
  // } // dials
}
