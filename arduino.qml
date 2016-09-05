import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.LocalStorage 2.0
import QtQuick.Window 2.0


Rectangle {

    property int dpi: Screen.pixelDensity * 25.4

    function dp(x){
        if(dpi < 120) {
            return x; // Для обычного монитора компьютера
        } else {
            return x*(dpi/160);
        }
    }

//    color:"black"
    //opacity:arduino.brightness / 1024;
    width: dp(800)
    height: dp(500)

    Column {
        x: dp(216)
        y: dp(307)
        Text{text:"LED";color:"white"}

        Switch {
            id:led
            checked: true
            onCheckedChanged:
            {
                if (checked == true)
                {
                    arduino.turnOn(1);
                }
                else
                {
                    arduino.turnOff(1);
                }
            }
        }
        Switch {
            id:relay
            checked: true
            onCheckedChanged:
            {
                if (checked == true)
                {
                    arduino.turnOn(2);
                }
                else
                {
                    arduino.turnOff(2);
                }
            }
        }
    }

    Dial
    {
       x: dp(10)
       y: dp(100)
       value:120 - (arduino.brightness / 1024) * 120;
    }



    Dial
    {
       x: dp(258)
       y: dp(100)
       value:(arduino.volume / 1024) * 120;
    }

    Dial
    {
       x: dp(516)
       y: dp(100)
       value: 90
    }

}

