import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

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
                    text: ""

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


                // Login Button
                Button
                {

                    id: btn_login

                    anchors.top: rect_password.bottom
                    anchors.topMargin: 10

                    text: "Login"
                    onClicked:
                    {

                    }

                }



            }
        }
    }
}




