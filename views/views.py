# import required modules 
import pymysql
from flask_restful import*
from flask import*
from functions import*
import pymysql.cursors
from flask_jwt_extended import create_access_token, jwt_required, create_refresh_token



    

# Member signup
class MemberSignUp(Resource):
    def post(self):
        # connect to MySQL
        json=request.json
        surname=json['surname']
        others=json['others']
        gender=json['gender']
        email=json['email']
        phone=json['phone']
        dob=json['dob']
        password=json['password']
        location_id=json['location_id']

        # validating the password
        response=passwordValidity(password)
        if response == True:
            if check_phone(phone):
                connection=pymysql.connect(host='localhost',user='root',password='',database='medilab2')
                cursor=connection.cursor()
                # Insert Data
                sql = ''' Insert into members (surname, others, gender, email, phone, dob, password, location_id)values(%s,%s,%s,%s,%s,%s,%s,%s) '''
                # provide data\
                
                data=(surname, others, gender, encrypt(email), encrypt(phone), dob, hash_password(password), location_id) 
                try:
                    cursor.execute(sql, data)
                    connection.commit()
                    # send SMS/Email
                    code = gen_random(6)
                    send_sms(phone, '''Thankyou for joining Medilab. Your Secret Code is:{}. Do not share.'''.format(code))
                    return jsonify({'message': 'Successfuly Registered'})
                except:
                    connection.rollback()
                    return jsonify({'message': 'Registration failed. Try Again.'})
                
            else:
                return jsonify({'message': 'Invalid Phone (+254)'})
        else:
           return jsonify({'message': response})
        
class MemberSignin(Resource):
    def post(self):
        json = request.json
        surname=json['surname']
        password=json['password']

        # The user enters a Plain text Email
        sql="select * from members where surname = %s"
        # data = (encrypt(email))

        connection=pymysql.connect(host='localhost',user='root',password='',database='medilab2')

        cursor = connection.cursor(pymysql.cursors.DictCursor)
        cursor.execute(sql, surname)
        count = cursor.rowcount
        if count == 0:
            return jsonify({'message': 'User does not Exist'})
        else:
            # user Exist 
            member = cursor.fetchone()
            hashed_password = member['password']  #This password is hashed
            # Jane provided a plane password
            if hash_verify(password, hashed_password):
                # TODO JSON Web Tokens
                access_token = create_access_token(identity=surname, fresh=True)
                refresh_token = create_refresh_token(surname)
                return jsonify({'message': member,
                                'access_token': access_token,
                                'refresh_token':refresh_token})
            else:
                return jsonify({'message': 'Login Failed'})
        # # ..
        # return jsonify({'message': count})
        

# JWT Tokens -Where are they used
# can we use encrypted email?

# According to the current web page context, a JSON Web Token (JWT) is an open standard that defines a compact and self-contained way for securely transmitting information between parties as a JSON object. It is an open standard (RFC 7519) that defines a set of claims that can be verified and trusted because they are digitally signed. The signature can use a secret or a public/private key pair. 
 
#  Member Profile
class MemberProfile(Resource):
    @jwt_required(refresh=True)
    def post(self):
        json = request.json
        member_id = json['member_id']
        sql="select * from members where member_id = %s"

        connection=pymysql.connect(host='localhost',user='root',password='',database='medilab2')

        cursor = connection.cursor(pymysql.cursors.DictCursor)
        cursor.execute(sql, member_id)
        count = cursor.rowcount
        if count == 0:
            return jsonify({'message': 'Member does not Exist'})
        else:
            member = cursor.fetchone()
            return jsonify({'message': member})
        
# Adding Dependant 
class AddDependant(Resource):
    @jwt_required(refresh=True)

    def post(self):
        json = request.json
        member_id = json['member_id']
        surname = json['surname']
        others = json['others']
        dob = json['dob']
        connection=pymysql.connect(host='localhost',user='root',password='',database='medilab2')
        cursor=connection.cursor()
                # Insert Data
        sql = ''' Insert into dependants (member_id, surname, others, dob)values(%s,%s,%s,%s) '''
    # providing data
        data = (member_id, surname, others, dob)
        try:
          cursor.execute(sql, data)
          connection.commit()
          return jsonify({'message': 'Dependant Added'})
        except:
            connection.rollback()
            return jsonify({'message': 'Failed. Try Again'})
        
# View dependant        
class ViewDependant(Resource):
    @jwt_required(refresh=True)
    def post(self):
        json = request.json
        member_id = json['member_id']
        sql="select * from dependants where member_id = %s"

        connection=pymysql.connect(host='localhost',user='root',password='',database='medilab2')

        cursor = connection.cursor(pymysql.cursors.DictCursor)
        cursor.execute(sql, member_id)
        count = cursor.rowcount
        if count == 0:
            return jsonify({'message': 'Dependant does not Exist'})
        else:
            dependant = cursor.fetchall()
            return jsonify({'message': dependant})
        
# {} - Means Object in JSON, come s with key-value
# [] - Means a JSON Array
# [{},{}] - JSON Array -with JSON Objects inside

# laboratories
class Laboratories(Resource):
    def get(self):
        sql = "select * from laboratories"
        connection = pymysql.connect(host='localhost', user='root', password='' , database='medilab2')
        cursor = connection.cursor(pymysql.cursors.DictCursor)
        cursor.execute(sql)
        count = cursor.rowcount
        if count == 0:
            return jsonify ({'message': 'No Laboratories Listed'})
        else:
            laboratories = cursor.fetchall()
            return jsonify(laboratories)
        
 #  lab tests
class LabTests(Resource):
    def post(self):
        json = request.json
        lab_id = json['lab_id']
        sql = "select * from lab_tests where lab_id = %s"
        connection = pymysql.connect(host='localhost',
                                     user='root',
                                     password='',
                                     database='medilab2')

        cursor = connection.cursor(pymysql.cursors.DictCursor)
        cursor.execute(sql, lab_id)
        count = cursor.rowcount
        if count == 0:
            return jsonify({'message': 'No Lab tests'})
        else:
            lab_tests = cursor.fetchall()
            return jsonify(lab_tests)

 # Make Booking
class MakeBooking(Resource):
    def post(self):
        # Connect to MySQL
        json = request.json
        member_id = json['member_id']
        booked_for = json['booked_for']
        dependant_id = json['dependant_id']
        test_id = json['test_id']
        appointment_date = json['appointment_date']
        appointment_time = json['appointment_time']
        where_taken = json['where_taken']
        latitude = json['latitude']
        longitude = json['longitude']
        lab_id = json['lab_id']
        invoice_no = json['invoice_no']


        connection = pymysql.connect(host='localhost',
                                     user='root',
                                     password='',
                                     database='medilab2')
        cursor = connection.cursor()
        # Insert Data
        sql = ''' Insert into bookings(member_id,booked_for, dependant_id,test_id, appointment_date,
         appointment_time, where_taken, latitude,longitude, lab_id, invoice_no )
          values(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s) '''
        # Provide Data
        data = (member_id,booked_for, dependant_id,test_id, appointment_date,
         appointment_time, where_taken, latitude,longitude, lab_id, invoice_no)
        # try:
        cursor.execute(sql, data)
        connection.commit()
        # Select from members to find Phone No
        sql = '''select * from members where member_id = %s'''
        cursor = connection.cursor(pymysql.cursors.DictCursor)
        cursor.execute(sql, member_id)
        member = cursor.fetchone()
        # Get phone No
        phone = member['phone']
        # Send SMS to above phone number . NB: decrypt phone number!
        send_sms(decrypt(phone), "Booking Scheduled on {} at {} : Invoice No. {} "
        .format(appointment_date, appointment_time, invoice_no))
        return jsonify({'message': 'Booking Received. '})
        # except:
        #     connection.rollback()
        #     return jsonify({'message': 'Failed. Try Again'})
 
 
 
# mybookings
class MyBookings(Resource):
    def get(self):
        json = request.json
        member_id = json['member_id']
        sql = "select * from bookings where member_id = %s"
        connection = pymysql.connect(host='localhost',
                                     user='root',
                                     password='',
                                     database='medilab2')

        cursor = connection.cursor(pymysql.cursors.DictCursor)
        cursor.execute(sql, member_id)
        count = cursor.rowcount
        if count == 0:
            return jsonify({'message': 'No Bookings'})
        else:
            bookings = cursor.fetchall()
            # return str(bookings)
            import json
            jsonStr = json.dumps(bookings, indent=1, sort_keys=True, default=str)
            # read json.dumps 
            return json.loads(jsonStr)

# make payment
class MakePayment(Resource):
    def post(self):
        json = request.json
        phone = json['phone']
        amount = json['amount']
        invoice_no = json['invoice_no']
        # Access Mpesa Functions locatated in functions.py
        mpesa_payment(amount, phone, invoice_no)
        return jsonify({'message': 'Sent - Complete Payment on Your Phone.'})



        
# practice
# SQL
# CLASSES ,FUNCTIONS
# IF ELSE
# CURSOR
# TRY/EXCEPT
# JSON
# RETURN
# 
# 

