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

    id: window_main

    visible: true

    // Height property of the Window fixed at 800px
    height: 800
    maximumHeight: height
    minimumHeight: height

    // Width property of the Window fixed at 480px
    width: 480
    maximumWidth: width
    minimumWidth: width

    StackView
    {

        id: stack_application

        height: window_main.height
        width: window_main.width

        initialItem: component_login_screen


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
        Component
        {

            id: component_login_screen

            MouseArea
            {

                id: mArea_login_screen

                anchors.fill: stack_application


                // Screen Title
                Text
                {

                    id: txt_title

                    anchors.horizontalCenter:
                        mArea_login_screen.horizontalCenter
                    anchors.top: mArea_login_screen.top
                    anchors.topMargin: 10

                    font.pixelSize: 14
                    text: "Week Day Calendar Application Login Screen"

                }


                // Error Label
                Text
                {

                    id: txt_error
                    anchors.top: txt_title.bottom
                    anchors.topMargin: 5
                    text: " "

                }



                // E-mail Rectangle
                Rectangle
                {

                    id: rect_email
                    anchors.top: txt_error.bottom
                    anchors.topMargin: 5

                    border.color: "black"
                    color: "transparent"

                    width: 240
                    height: 25


                    Text
                    {

                        id: txt_email

                        width: 55

                        text: "E-mail: "

                    }


                    TextField
                    {

                        id: input_email

                        anchors.left: txt_email.right

                        width: rect_email.width - txt_email.width

                        maximumLength: 40

                    }

                }



                // Password Rectangle
                Rectangle
                {

                    id: rect_password

                    anchors.top: rect_email.bottom

                    border.color: "black"
                    color: "transparent"

                    width: 240
                    height: 25


                    Text
                    {

                        id: txt_password

                        width: 55

                        text: "Password: "

                    }


                    TextField
                    {

                        id: input_password

                        anchors.left: txt_password.right

                        width: rect_email.width - txt_password.width

                        echoMode: TextInput.Password
                        maximumLength: 26

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

                    id: btn_login

                    anchors.top: rect_password.bottom
                    anchors.topMargin: 10

                    text: "Login"
                    //checkable: true
                    //checked: busyIndication.running

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
                                    + "e.g. richardfagg0t@hotmail.com"

                        // Validates the password
                        } else if(input_password.text.length < 6)
                        {
                            txt_error.text
                                    = "Password must have six (6) or more "
                                    + "characters."

                        // Login is successful!
                        } else
                        {

                            btn_login.text = " " // Hides text
                            timer_login.start() // Displays "spinner"

                        }
                    }



                /* Since QML draws in declaration order putting it last */
                BusyIndicator
                {

                    id: busyIndicator_login

                    anchors.top: rect_password.bottom
                    anchors.topMargin: 10
                    anchors.horizontalCenter: btn_login.horizontalCenter
                    anchors.verticalCenter: btn_login.verticalCenter

                    height: 14
                    width: 14

                    running: false

                }

            }

                /* A Timer that when activated displays a BusyIndicator (BI)
                 * then deactivates after one (1) second along with the BI */
                Timer
                {

                    id: timer_login

                    interval: 1000;
                    running: false
                    repeat: false
                    triggeredOnStart: true

                    /* Displays a BusyIndicator if not displaying one
                     * If the BusyIndicator is already running, disable it
                     * and load the "Dashboard" */
                    onTriggered: if(busyIndicator_login.running == true)
                                 {

                                     busyIndicator_login.running = false
                                     stack_application.push(component_dashboard)
                                     btn_login.text = "Login"
                                     input_email.text = ""
                                     input_password.text = ""

                                 } else
                                 {

                                     busyIndicator_login.running = true

                                 }




                }
            }
        }



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
        Component
        {

            id: component_dashboard


            MouseArea
            {

                id: mArea_dashboard

                //anchors.fill: stack_application

                ListModel
                {

                    id: listModel_days

                    ListElement
                    {
                        name: "Monday"
                    }

                    ListElement
                    {
                        name: "Tuesday"
                    }

                    ListElement
                    {
                        name: "Wednesday"
                    }

                    ListElement
                    {
                        name: "Thursday"
                    }

                    ListElement
                    {
                        name: "Friday"
                    }

                    ListElement
                    {
                        name: "Saturday"
                    }

                    ListElement
                    {
                        name: "Sunday"
                    }

                }

                ListView
                {

                    id: listView_days

                    height: window_main.height / 8 * 7
                    width: window_main.width

                    Component
                    {

                        id: delegate_days

                        Rectangle
                        {

                            id: wrapper_days
                            width: listView_days.width
                            height: txt_day.height
                            color: "transparent"

                            MouseArea
                            {

                                anchors.fill: wrapper_days
                                drag.target: wrapper_days
                                enabled: true

                                onClicked: wrapper_days.color = "green"


                            }

                            Text
                            {

                                id: txt_day

                                height: listView_days.height / listModel_days.count

                                anchors.horizontalCenter: wrapper_days.horizontalCenter

                                text: name

                            }
                        }
                    }

                    model: listModel_days
                    delegate: delegate_days
                    focus: true


                }

                Button
                {
                    id: btn_back_to_login

                    anchors.top: listView_days.bottom
                    anchors.horizontalCenter: listView_days.horizontalCenter

                    text: "BACK"

                    height: window_main.height / 8
                    width: window_main.width

                    MouseArea
                    {

                        anchors.centerIn: btn_back_to_login

                        height: btn_back_to_login.height
                        width: btn_back_to_login.width

                        onClicked: stack_application.pop()



                    }
                }


            }
        }



        Component
        {
            id: component_day_of_the_week

            MouseArea
            {

                id: mArea_day_of_the_week

                Text
                {
                    id: txt_selected_day
                    text: " "
                }

                Button
                {
                    id: btn_back_to_dashboard
                }




            }
        }




    }
}




