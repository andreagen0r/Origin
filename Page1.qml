import QtQuick
import QtQuick.Layouts
import Origin

Page {
  id: page1
  title: qsTr("Page 1")

  GridLayout {
    anchors.fill: parent

    columns: 2
    rows: 2
    columnSpacing: 12
    rowSpacing: 12

    Texts {
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.preferredHeight: 50
      Layout.preferredWidth: 50
    }

    Frame {
      id: textbox
      clip: true
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.preferredHeight: 50
      Layout.preferredWidth: 50

      RowLayout {
        anchors.fill: parent
        spacing: 12

        ColumnLayout {
          Layout.preferredWidth: 40
          Layout.fillWidth: true

          TextField{
            id: txtField1
            Layout.fillWidth: true
            selectByMouse: true
            placeholderText: "Enter description "
            focus: true
          }

          TextField{
            Layout.fillWidth: true
            selectByMouse: true
            placeholderText: "Enter description "
            enabled: false
          }

          TextField{
            enabled: false
            Layout.fillWidth: true
            selectByMouse: true
            text: txtField1.text
          }

          ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignHCenter;

            TextArea {
              id: txA1
              selectByMouse: true
              selectByKeyboard: true
              textFormat: TextEdit.MarkdownText
              text: "<b>Hello</b> <i>World!</i>   At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."

              KeyNavigation.priority: KeyNavigation.BeforeItem
              KeyNavigation.tab: txA2
            }
          }
        }


        ScrollView {
          Layout.fillWidth: true
          Layout.fillHeight: true
          Layout.preferredWidth: 60
          Layout.alignment: Qt.AlignHCenter;

          TextArea {
            id: txA2
            wrapMode: Text.WordWrap
            selectByMouse: true
            text: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."
          }
        }
      }
    }

    Buttons {
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.preferredHeight: 50
      Layout.preferredWidth: 50
    }

    Colors {
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.preferredHeight: 50
      Layout.preferredWidth: 50
    }
  }
} // Page1
