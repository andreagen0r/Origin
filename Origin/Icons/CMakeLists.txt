set(IMAGES
    atom-solid.svg
    check-mark.svg
    caret-right.svg
    caret-down.svg
)

if(DEV_BUILD)

    qt_add_qml_module(Icons
    URI "Icons"
    VERSION 1.0
    STATIC
    RESOURCES
        ${IMAGENS}
)

target_link_libraries(sandbox PRIVATE "Iconsplugin")
else()
    qt_add_qml_module(Icons
        URI "Icons"
        VERSION 1.0
        RESOURCES
            ${IMAGENS}
    )

endif()
