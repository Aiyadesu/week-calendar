import QtQuick 2.3
import QtQuick.Controls 1.4


/*
 * The Dashboard Screen for the Week Calendar Application.
 * It shows the days of the week.
 *
 * When clicking on a day of the week, the user will be taken to a
 * screen that displays the day of the week that was just clicked.
 *
 * There is a "BACK" button in the bottom right of the page.
 *
 * Pre-condition: User must have successfully logged in.
 * Post-conditions:
 * 1) The user will return to the "Login" screen.
 * 2) The user will be on a "Day of the Week" screen.
 */
Item
{

    id: dashboard;

    MouseArea
    {

        id: mArea_dashboard;

        ListModel
        {

            id: listModel_days;

            ListElement
            {
                name: "Monday";
            }

            ListElement
            {
                name: "Tuesday";
            }

            ListElement
            {
                name: "Wednesday";
            }

            ListElement
            {
                name: "Thursday";
            }

            ListElement
            {
                name: "Friday";
            }

            ListElement
            {
                name: "Saturday";
            }

            ListElement
            {
                name: "Sunday";
            }

        }

        ListView
        {

            id: listView_days;

            height: window_main.height / 8 * 7;
            width: window_main.width;

            Component
            {

                id: delegate_days;

                Rectangle
                {

                    id: wrapper_days;

                    height: txt_day.height;
                    width: listView_days.width;

                    color: "transparent";

                    //signal send(string day)
                    //onSend: console.log("Send signal to: " + component_day + ", " + day);

                    Component.onCompleted:
                    {
                       // day = txt_day.text;
                        //wrapper_days.send.connect(passInfo);

                    }



                    function passInfo()
                    {
                        //console.log("Sending info to: " + component_day + ", " + day)
                        stack_application.push(component_day);

                    }



                    MouseArea
                    {

                        anchors.fill: wrapper_days;
                        drag.target: wrapper_days;
                        enabled: true;

                        onClicked:
                            passInfo();
                            //stack_application.push(component_day);

                    }

                    Text
                    {

                        id: txt_day;

                        height: listView_days.height / listModel_days.count;

                        anchors.horizontalCenter: wrapper_days.horizontalCenter;

                        text: name;

                    }
                }
            }

            model: listModel_days;
            delegate: delegate_days;
            focus: true;


        }

        Button
        {
            id: btn_back_to_login;

            height: window_main.height / 8;
            width: window_main.width;

            anchors.top: listView_days.bottom;
            anchors.horizontalCenter: listView_days.horizontalCenter;

            text: "BACK";

            MouseArea
            {

                anchors.centerIn: btn_back_to_login;

                height: btn_back_to_login.height;
                width: btn_back_to_login.width;

                onClicked: stack_application.pop();

            }
        }
    }
}
