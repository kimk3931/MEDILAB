from flask import Flask
from flask_restful import*
from flask_jwt_extended import JWTManager
app = Flask(__name__)

# Set up JWT
from datetime import timedelta
app.secret_key = "hfjdfhgjkdfhgjkdf865785"
app.config["JWT_ACCESS_TOKEN_EXPIRES"] = timedelta(minutes=1)
app.config["JWT_REFRESH_TOKEN_EXPIRES"] = timedelta(minutes=21)
jwt = JWTManager(app)


# Make the app an API
api = Api(app)

# API for members
# Configure the views/endpoints
from views.views import MemberSignUp,MemberSignin,MemberProfile,AddDependant,ViewDependant,Laboratories,LabTests,MakeBooking,MyBookings,MakePayment
api.add_resource(MemberSignUp, '/api/member_signup')
api.add_resource(MemberSignin, '/api/member_signin')
api.add_resource(MemberProfile,'/api/member_profile')
api.add_resource(AddDependant,'/api/add_dependant')
api.add_resource(ViewDependant, '/api/view_dependant')
api.add_resource(Laboratories, '/api/laboratories')
api.add_resource(LabTests, '/api/lab_test')
api.add_resource(MakeBooking, '/api/make_booking')
api.add_resource(MyBookings, '/api/my_bookings')
api.add_resource(MakePayment, '/api/make_payment')


# ..................
# DASHBOARD APIs
from views.views_dashboard import LabSignup,LabSignin,LabProfile,AddLabTest,ViewLabTest,ViewLabBooking,AddNurses,ViewNurses,TaskAllocation
api.add_resource(LabSignup, '/api/lab_signup')
api.add_resource(LabSignin, '/api/lab_signin')
api.add_resource(LabProfile, '/api/lab_profile')
api.add_resource(AddLabTest, '/api/add_labtest')
api.add_resource(ViewLabTest, '/api/view_labtest')
api.add_resource(ViewLabBooking, '/api/view_labbooking')
api.add_resource(AddNurses, '/api/add_nurses')
api.add_resource(ViewNurses, '/api/view_nurses')
api.add_resource(TaskAllocation, '/api/task_allocation')


# CONFIGURING NURSE APPS
from views.views_nurses import NurseSignin,ViewAssignment,ViewInvoiceDetails
api.add_resource(NurseSignin, '/api/nurse_signin')
api.add_resource(ViewAssignment, '/api/assignment_view')
api.add_resource(ViewInvoiceDetails, '/api/invoice_view')





















if __name__ == '__main__':
    app.run(debug=True)

# Base URL 127.0.0.1:5000