import QtQuick

QtObject {

  readonly property Palette dark: Palette {

    readonly property color gray_00: "#0D0D10"
    readonly property color gray_01: "#19191F"
    readonly property color gray_02: "#222229"
    readonly property color gray_03: "#28282E"
    readonly property color gray_04: "#2A2A30"
    readonly property color gray_05: "#2C2C31"
    readonly property color gray_06: "#2E2E33"
    readonly property color gray_07: "#48484D"
    readonly property color gray_08: "#696970"
    readonly property color gray_09: "#818188"
    readonly property color gray_10: "#9B9BA1"
    readonly property color gray_11: "#B5B5B9"
    readonly property color gray_12: "#CACACC"
    readonly property color gray_13: "#DEDEE0"
    readonly property color gray_14: "#EBEBED"

    readonly property color primary_01: "#43331F"
    readonly property color primary_02: "#705634"
    readonly property color primary_03: "#9D7849"
    readonly property color primary_04: "#CB9B5E"
    readonly property color primary_05: "#D6B181"
    readonly property color primary_06: "#E2C7A5"
    readonly property color primary_07: "#EDDDC9"

    active.highlight: primary_04
    inactive.highlight: primary_04
    disabled.highlight: primary_02

    active.accent: active.highlight
    inactive.accent: inactive.highlight
    disabled.accent: disabled.highlight

    link: "#5E8AA2"

    linkVisited: "#5E6E77"

    active.base: gray_02
    inactive.base: gray_02
    disabled.base: gray_03

    active.alternateBase: gray_03
    inactive.alternateBase: gray_03
    disabled.alternateBase: gray_04

    active.light: gray_09
    inactive.light: gray_09
    disabled.light: gray_08

    active.midlight: gray_08
    inactive.midlight: gray_08
    disabled.midlight: gray_07

    active.button: gray_07
    inactive.button: gray_07
    disabled.button: gray_03

    active.mid: gray_02
    inactive.mid: gray_02
    disabled.mid: gray_03

    active.dark: gray_01
    inactive.dark: gray_01
    disabled.dark: gray_02

    active.shadow: gray_00
    inactive.shadow: gray_00
    disabled.shadow: gray_01

    active.brightText: gray_12
    inactive.brightText: gray_12
    disabled.brightText: gray_08

    active.buttonText: gray_12
    inactive.buttonText: gray_12
    disabled.buttonText: gray_08

    active.highlightedText: gray_02
    inactive.highlightedText: gray_02
    disabled.highlightedText: gray_03

    active.placeholderText: gray_08
    inactive.placeholderText: gray_08
    disabled.placeholderText: gray_07

    active.text: gray_11
    inactive.text: gray_11
    disabled.text: gray_08

    active.toolTipText: gray_11
    inactive.toolTipText: gray_11
    disabled.toolTipText: gray_08

    active.windowText: gray_11
    inactive.windowText: gray_11
    disabled.windowText: gray_08

    active.window: gray_06
    inactive.window: gray_06
    disabled.window: gray_02

    active.toolTipBase: gray_01
    inactive.toolTipBase: gray_01
    disabled.toolTipBase: gray_05
  }
}
