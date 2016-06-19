import QtQuick 2.3
import QtQuick.Controls 1.4


/*
 * The Day of the Week Screen for the Week Calendar Application.
 * It shows the day of the week selected from the Dashboard Screen.
 *
 * Users cannot do anything here except for go back to the
 * Dashboard Screen.
 *
 * Pre-condition: Selected a day of the week from the Dashboard.
 * Post-condition: User goes back to the Dashboard screen.
 */
Item
{

    id: display_day;

    height: 800;
    width: 480;

    property string day : "";

    signal back();

    MouseArea
    {

        id: mArea_day_of_the_week;

        width: display_day.width;

        Text
        {

            id: txt_selected_day;

            height: 200;
            width: display_day.width;

            anchors.topMargin: height / 2;
            anchors.horizontalCenter: mArea_day_of_the_week.horizontalCenter;

            text: day;

        }

        // Back Button
        Button
        {

            id: btn_back_to_dashboard;

            anchors.top: txt_selected_day.bottom;

            width: display_day.width;

            text: "BACK";

            MouseArea
            {
                id: mArea_back_to_dashboard;

                height: btn_back_to_dashboard.height;
                width: btn_back_to_dashboard.width;

                onClicked: back();
            }

        }
    }
}
