# Medilab API
This is an API build in Python Flask framework nd MySQL database,


### The API has 3 parts

1. The API allows the client to register a member, sign in, profile, add dependants, make booking, make payment etc. 

2. Other APIs include: Add Laboratory, add lab tests, add nurses, allocate to nurses.

3. Nurse APIs allows nurses to Login and access their allocated tasks, change password.


### How to Install
Step1. Download XAMPP from https://www.apachefriends.org/
Step2. Create and import medilab2.sql.

Step3. Create a flask app and install these packages
```
pip install flask
pip install pymysql
pip install bycrypt
pip install africastalking
pip install fpdf
```
Step4. Python Set Up
Create a Folder nameed views and place the views_nurses.py .views.py and views_dashboard.py Inside.

In the root folder create a functions.py.
In the root folder again create app.py and configure endpoints.

Run Your App.

Useful Links





