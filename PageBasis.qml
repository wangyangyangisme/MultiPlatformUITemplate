import QtQuick 2.5
import QtQuick.Controls 2.1

//Virtual only, use this for page basis
//all changes made here will affect all pages using this object

Rectangle {
    color: "#252525"

    function refreshPage(widthA, heightA) {
        width = widthA
        height = heightA
    }    
}


