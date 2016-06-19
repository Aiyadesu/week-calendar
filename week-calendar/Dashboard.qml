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

    height: 800;
    width: 480;

    signal displayDay(string day);
    signal back();

    readonly property var days_of_the_week_array:
        ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"
        , "Saturday", "Sunday"];

    // Populates the ListModel with ListElement data
    Stack.onStatusChanged:
    {

        if(Stack.status === Stack.Activating)
        {
            for(var day_of_the_week = 0; day_of_the_week
                < days_of_the_week_array.length; day_of_the_week++)
            {

                listModel_days.append(
                            {name: days_of_the_week_array[day_of_the_week]});

            }
        }

    }

    MouseArea
    {

        id: mArea_dashboard;

        ListModel
        {

            id: listModel_days;

        }

        ListView
        {

            id: listView_days;

            height: dashboard.height - (dashboard.height / 8);

            Component
            {

                id: delegate_days;

                Rectangle
                {

                    id: wrapper_days;

                    height: dashboard.height / 8;
                    width: dashboard.width;

                    color: "transparent";

                    Text
                    {

                        id: txt_day;

                        height: dashboard.height / 8;

                        anchors.horizontalCenter:
                            wrapper_days.horizontalCenter;

                        text: name;


                        MouseArea
                        {
                            height: dashboard.height / 8;
                            width: dashboard.width;
                            drag.target: txt_day;
                            enabled: true;

                            onClicked:
                                displayDay(txt_day.text);

                        }

                    }
                }
            }

            model: listModel_days;
            delegate: delegate_days;
            focus: true;

        }

        // Back Button
        Button
        {

            id: btn_back_to_login;

            width: dashboard.width;

            anchors.top: listView_days.bottom;
            //anchors.horizontalCenter: listView_days.horizontalCenter;

            text: "BACK";

            MouseArea
            {

                anchors.centerIn: btn_back_to_login;

                onClicked: back();

            }
        }
    }
}
