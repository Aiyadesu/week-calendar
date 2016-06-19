import QtQuick 2.3
import QtQuick.Controls 1.4


Item
{

    id: display_day;

    MouseArea
    {

        id: mArea_day_of_the_week;

        width: window_main.width;

        Component.onCompleted:
            txt_selected_day.text = window_main.day_selected;

        Text
        {

            id: txt_selected_day;

            height: 200;
            width: window_main.width;

            anchors.topMargin: height / 2;
            anchors.horizontalCenter: mArea_day_of_the_week.horizontalCenter;

            // Should be a slot or something but I can't figure it out
            text: "KAPPA";


        }

        Button
        {

            id: btn_back_to_dashboard;

            anchors.top: txt_selected_day.bottom;

            width: window_main.width;

            text: "BACK";

            MouseArea
            {
                id: mArea_back_to_dashboard;

                height: btn_back_to_dashboard.height;
                width: btn_back_to_dashboard.width;

                onClicked: stack_application.pop();
            }

        }
    }
}
