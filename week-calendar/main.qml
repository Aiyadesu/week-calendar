import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4


/*
 * This application allows users to view the "Day of the Week".
 *
 * It consists of three parts: The "Login", "Dashboard" and "Day of the Week"
 * screens.
 *
 * To Login a valid e-mail address and password are required to access the
 * "Dashboard" screen.
 *
 * From the "Dashboard" screen, users may return to the "Login" screen
 * at any time or access the "Day of the Week" screen by clicking on the
 * desired "Day of the Week".
 *
 * From the "Day of the Week" screen, users will have the information they
 * requested. They may return to the "Dashboard" screen at any time.
 */
Window
{

    id: window_main;

    visible: true;

    property string day_selected;

    // Height property of the Window fixed at 800px
    height: 800;
    maximumHeight: height;
    minimumHeight: height;

    // Width property of the Window fixed at 480px
    width: 480;
    maximumWidth: width;
    minimumWidth: width;

    StackView
    {

        id: stack_application;

        height: window_main.height;
        width: window_main.width;

        initialItem: component_login;

        Component
        {

            id: component_login;

            Login
            {

                onLogin:
                {

                    stack_application.push(component_dashboard);
                    stack_application.currentItem.states;

                }

            }
        }

        Component
        {

            id: component_dashboard;

            Dashboard
            {

                onBack: stack_application.pop();

                onDisplayDay:
                {

                    stack_application.push(component_day);
                    stack_application.currentItem.day = day;

                }
            }
        }

        Component
        {

            id: component_day;

            Day
            {
                onBack: stack_application.pop();
            }
        }
    }
}






