import QtQuick 2.3
import QtQuick.Controls 1.4

/*
 * The Login Screen for the Week Calendar Application
 * This screen should be the initialItem of the StackView
 *
 * The Login Screen contains three (3) inputs:
 * 1) E-mail: A rectangle with a text field in it that takes an e-mail
 * 2) Password: A tectangle with a text field in it that takes a pass
 * word. The password input should be displayed as dots.
 * 3) Login: A button that has the text "Login" centered in it.
 *
 * There is a text label that displays an error message
 * if Login was invalidated, otherwise blank.
 *
 * Pre-condition: None.
 * Post-condition: The "Dashboard" screen is displayed.
 */
Item
{

    signal login();

    MouseArea
    {

        id: mArea_login_screen;

        anchors.fill: parent;

        // Screen Title
        Text
        {

            id: txt_title;

            anchors.horizontalCenter:
                mArea_login_screen.horizontalCenter;
            anchors.top: mArea_login_screen.top;
            anchors.topMargin: 10;

            font.pixelSize: 14;
            text: "Week Day Calendar Application Login Screen";

        }


        // Error Label
        Text
        {

            id: txt_error;

            anchors.top: txt_title.bottom;
            anchors.topMargin: 5;

            text: " ";

        }


        // E-mail Rectangle
        Rectangle
        {

            id: rect_email;
            anchors.top: txt_error.bottom;
            anchors.topMargin: 5;

            border.color: "black";
            color: "transparent";

            width: 240;
            height: 25;


            Text
            {

                id: txt_email;

                width: 55;

                text: "E-mail: ";

            }


            TextField
            {

                id: input_email;

                anchors.left: txt_email.right;

                width: rect_email.width - txt_email.width;

                maximumLength: 40;

            }
        }


        // Password Rectangle
        Rectangle
        {

            id: rect_password;

            anchors.top: rect_email.bottom;

            border.color: "black";
            color: "transparent";

            width: 240;
            height: 25;


            Text
            {

                id: txt_password;

                width: 55;

                text: "Password: ";

            }


            TextField
            {

                id: input_password;

                anchors.left: txt_password.right;

                width: rect_email.width - txt_password.width;

                echoMode: TextInput.Password;
                maximumLength: 26;

            }
        }


        /* Login Button
         *
         * Contains the following components:
         * 1) A Timer to stop the BusyIndicator
         * 2) A Button to represent the "Login" Button
         * 3) A BusyIndicator to display an action is occuring
         *
         * When the "Login" button is clicked, only then are the
         * other user inputs validated.
         *
         * If a successful login is detected, then "Login" disappears
         * on the button and a "spinner" or BusyIndicator is displayed.
         * After one (1) second, the next Screen is displayed.
         */
        Button
        {

            id: btn_login;

            anchors.top: rect_password.bottom;
            anchors.topMargin: 10;

            text: "Login";

            onClicked:
            {

                // Resets the error label
                txt_error.text = " "

                // JavaScript validation for e-mail using RegExp
                var valid_email_pattern
                        = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w+)+$/;
                var result = valid_email_pattern.test(input_email.text);

                // Validates the e-mail address
                if(result === false)
                {

                    txt_error.text
                            = "E-mail must be in the format of \n"
                            + "<sometext>@<sometext>.<somedomain> \n"
                            + "e.g. richardfagg0t@hotmail.com";

                    // Validates the password
                } else if(input_password.text.length < 6)
                {
                    txt_error.text
                            = "Password must have six (6) or more "
                            + "characters.";

                    // Login is successful!
                } else
                {

                    btn_login.text = " "; // Hides text
                    timer_login.start(); // Displays "spinner"

                }
            }


            /* Since QML draws in declaration order putting it last */
            BusyIndicator
            {

                id: busyIndicator_login;

                anchors.top: rect_password.bottom;
                anchors.topMargin: 10;
                anchors.horizontalCenter: btn_login.horizontalCenter;
                anchors.verticalCenter: btn_login.verticalCenter;

                height: 14;
                width: 14;

                running: false;

            }

        }

        /* A Timer that when activated displays a BusyIndicator (BI)
         * then deactivates after one (1) second along with the BI */
        Timer
        {

            id: timer_login

            interval: 1000;
            running: false;
            repeat: false;
            triggeredOnStart: true;

            /* Displays a BusyIndicator if not displaying one
             * If the BusyIndicator is already running, disable it
             * and load the "Dashboard" */
            onTriggered: if(busyIndicator_login.running == true)
                         {

                             busyIndicator_login.running = false;
                             login();
                             btn_login.text = "Login";
                             input_email.text = "";
                             input_password.text = "";

                         } else
                         {

                             busyIndicator_login.running = true;

                         }
        }
    }
}


