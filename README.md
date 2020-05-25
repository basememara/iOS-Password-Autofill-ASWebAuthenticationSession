# iOS ASWebAuthenticationSession with Password Autofill

This is a simple sample of using `ASWebAuthenticationSession` to login or sign into a website.
The purpose of this app is to demonstrate Password AutoFill not working with `ASWebAuthenticationSession`.

When navigating to the web page without the app, using the Safari, you are correctly shown the
native Password AutoFill dialogs for the login and signup forms:

https://zamzam.io/tests/autofill/signup.html

![Signup Password AutoFill](/Images/signup.png)

https://zamzam.io/tests/autofill/login.html

![Login Password AutoFill](/Images/login.png)

However, when viewed within the app, the same flow does not trigger the dialog in neither the login or signup submission. 
It simply dismisses the login/signup screen without any error.