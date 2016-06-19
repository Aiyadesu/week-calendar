import QtQuick 2.3
import QtQuick.Controls 1.4


Item
{

    id: display_day;

    property string text;

    MouseArea
    {

        id: mArea_day_of_the_week;

        Text
        {

            id: txt_selected_day;

            height: 200;
            width: window_main.width;

            // Should be a slot or something but I can't figure it out
            text: "";


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
