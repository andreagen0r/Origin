import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.TextField {
    id: control

    implicitWidth: implicitBackgroundWidth + leftInset + rightInset
                   || Math.max(contentWidth, placeholder.implicitWidth) + leftPadding + rightPadding
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding,
                             placeholder.implicitHeight + topPadding + bottomPadding)

    leftPadding: 6
    rightPadding: 6
    topPadding: 2
    bottomPadding: 2

    color: enabled ? control.palette.active.text : control.palette.disabled.text
    selectionColor: control.palette.active.highlight
    selectedTextColor: control.palette.active.highlightedText
    placeholderTextColor: !enabled ? palette.disabled.placeholderText : palette.active.placeholderText
    verticalAlignment: TextInput.AlignVCenter

    cursorDelegate: CursorDelegate {}

    PlaceholderText {
        id: placeholder
        x: control.leftPadding
        y: control.topPadding
        width: control.width - (control.leftPadding + control.rightPadding)
        height: control.height - (control.topPadding + control.bottomPadding)
        text: control.placeholderText
        font: control.font
        color: control.placeholderTextColor
        verticalAlignment: control.verticalAlignment
        elide: Text.ElideRight
        renderType: control.renderType
        visible: !control.length && !control.preeditText && (!control.activeFocus || control.horizontalAlignment !== Qt.AlignHCenter)
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 32
        color: control.enabled ? control.palette.active.base : control.palette.disabled.base

        Rectangle {
            anchors.bottom: parent.bottom
            width: parent.width
            visible: control.visible && control.activeFocus
            height: 2
            color: control.palette.active.highlight
        }
    }
}
