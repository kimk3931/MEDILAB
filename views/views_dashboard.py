import pymysql
from flask_restful import*
from flask import*
from functions import*
import pymysql.cursors

# import JWT packages
from flask_jwt_extended import create_access_token,jwt_required,create_refresh_token

class LabSignup(Resource):
    def post(self):
        json = request.json
        lab_name = json['lab_name']
        permit_id = json['permit_id']
        email = json['email']
        phone = json['phone']
        password = json['password']

# check password
        response = passwordValidity(password)
        if response:
            if check_phone(phone):
                connection=pymysql.connect(host='localhost',user='root',password='',database='medilab2')
                cursor=connection.cursor()
                sql = '''Insert into laboratories(lab_name, permit_id, email, phone, password) values(%s, %s, %s, %s, %s)'''

                # Data
                data = (lab_name, permit_id, email, encrypt(phone), hash_password(password))
                try:
                    cursor.execute(sql, data)
                    connection.commit()
                    code = gen_random(4)
                    send_sms(phone, '''Thankyou for joining Medilab. Your secret code is : {}. Do not share!!'''.format(code))
                    return jsonify({'message':'Succesfully Registered'})
                except:
                    connection.rollback()
                    return jsonify({'message':'Registration Failed'})

            else:
                return jsonify({'message':'Invalid Phone Enter +254'})
        else:
            return jsonify({'message':response})

# lab signin
class LabSignin(Resource):
    def post(self):
        json = request.json
        email = json['email']
        password = json['password']
        
        sql = 'select * from laboratories where email =%s '
        connection = pymysql.connect(host = 'localhost', user = 'root', password = '' , database = 'medilab2')
        cursor = connection.cursor(pymysql.cursors.DictCursor)
        cursor.execute(sql, email)
        count = cursor.rowcount
        if count == 0:
            return jsonify ({'message': 'Email does not exist'})
        else:
            lab = cursor.fetchone()
            hashed_password = lab['password']
            # Verify
            if hash_verify(password, hashed_password):
                # TODO JSON WEB TOKENS
                access_token = create_access_token(identity=email,fresh=True)
                refresh_token = create_refresh_token(email)

                return jsonify({'message': lab, 'access_token': access_token, 'refresh_token':refresh_token})
            else:
                return jsonify({'message': 'Login Failed'})
            
# LAB PROFILE
class LabProfile(Resource):
    @jwt_required(refresh=True)
    def post(self):
        json = request.json
        lab_id = json['lab_id']
        sql="select * from laboratories where lab_id = %s"

        connection=pymysql.connect(host='localhost',user='root',password='',database='medilab2')

        cursor = connection.cursor(pymysql.cursors.DictCursor)
        cursor.execute(sql, lab_id)
        count = cursor.rowcount
        if count == 0:
            return jsonify({'message': 'Lab does not Exist'})
        else:
            lab = cursor.fetchone()
            return jsonify({'message': lab})
        

# ADDING A LAB TEST
class AddLabTest(Resource):
    @jwt_required(refresh=True)

    def post(self):
        json = request.json
        lab_id = json['lab_id']
        test_name = json['test_name']
        test_description= json['test_description']
        test_cost= json['test_cost']
        test_discount= json['test_discount']
        availability= json['availability']
        more_info= json['more_info']

        connection=pymysql.connect(host='localhost',user='root',password='',database='medilab2')
        cursor=connection.cursor()
                # Insert Data
        sql = ''' Insert into lab_tests (lab_id, test_name, test_description, test_cost, test_discount, availability, more_in                                          fo)values(%s,%s,%s,%s,%s,%s,%s) '''
    # providing data
        data = (lab_id, test_name, test_description, test_cost, test_discount,availability, more_info)
        try:
          cursor.execute(sql, data)
          connection.commit()
          return jsonify({'message': 'Lab Test Added'})
        except:
            connection.rollback()
            return jsonify({'message': 'Failed. Try Again'})
        
# VIEW LABTEST
class ViewLabTest(Resource):
    @jwt_required(refresh=True)
    def post(self):
        json = request.json
        lab_id = json['lab_id']
        sql="select * from lab_tests where lab_id = %s"

        connection=pymysql.connect(host='localhost',user='root',password='',database='medilab2')

        cursor = connection.cursor(pymysql.cursors.DictCursor)
        cursor.execute(sql, lab_id)
        count = cursor.rowcount
        if count == 0:
            return jsonify({'message': 'Lab Test does not Exist'})
        else:
            LabTest = cursor.fetchall()
            return jsonify(LabTest)
        
 # VIEW bookings
class ViewLabBooking(Resource):
    @jwt_required(refresh=True)
    def post(self):
        json = request.json
        lab_id = json['lab_id']
        sql="select * from bookings where lab_id = %s"

        connection=pymysql.connect(host='localhost',user='root',password='',database='medilab2')

        cursor = connection.cursor(pymysql.cursors.DictCursor)
        cursor.execute(sql, lab_id)
        count = cursor.rowcount
        if count == 0:
            return jsonify({'message': 'No Bookings'})
        else:
            bookings = cursor.fetchall()
            for Booking in bookings:
                member_id = Booking['member_id']
                sql =  ''' select * from members where member_id =%s'''
                cursor = connection.cursor(pymysql.cursors.DictCursor)
                cursor.execute(sql, member_id)
                member = cursor.fetchone()
                Booking['key'] = member
                print(member)


            import json
            jsonStr = json.dumps(Booking, indent=1, sort_keys=True, default=str)
            return json.loads(jsonStr)

# ADD NURSE
class AddNurses(Resource):
    @jwt_required(refresh=True)

    def post(self):
        json = request.json
        surname = json['surname']
        others = json['others']
        lab_id = json['lab_id']
        gender = json['gender']
        email = json['email']
        phone = json['phone']
        password = gen_random(5)
        connection=pymysql.connect(host='localhost',user='root',password='',database='medilab2')
        cursor=connection.cursor()
                # Insert Data
        sql = ''' Insert into nurses (surname, others, lab_id, gender, email, phone, password )values(%s,%s,%s,%s,%s,%s,%s) '''
    # providing data
        data = (surname, others, lab_id, gender, encrypt(email), encrypt(phone), hash_password(password))
        try:
          cursor.execute(sql, data)
          connection.commit()
             #   Send SMS
        #   code = gen_random(6)
          send_sms (phone, '''Welcome to Medilab Hospital. We love to welcome new staff into our family. Your OTP is:{}. Your Username is {}. DO NOT SHARE!!!''' .format(password, surname))
          return jsonify({'message': 'Nurse Registration Successful, Check Your phone for Your Log In Credentials'})
        except:
            connection.rollback()
            return jsonify({'message': 'Nurse Registartion Failed'})

            
# VIEW NURSES
class ViewNurses(Resource):
    @jwt_required(refresh=True)
    def post(self):
        json = request.json
        lab_id = json['lab_id']
        sql="select * from nurses where lab_id = %s"

        connection=pymysql.connect(host='localhost',user='root',password='',database='medilab2')

        cursor = connection.cursor(pymysql.cursors.DictCursor)
        cursor.execute(sql, lab_id)
        count = cursor.rowcount
        if count == 0:
            return jsonify({'message': 'Nurse does not Exist'})
        else:
            Nurses = cursor.fetchall()
            return jsonify(Nurses)

# NURSE BOOKING ALLOCATION
class TaskAllocation(Resource):
    def post(self):
        json = request.json
        nurse_id = json['nurse_id']
        invoice_no = json['invoice_no']

        # Check if above invoice is active
        sql = '''select * from nurse_lab_allocations where invoice_no = %s'''
        connection = pymysql.connect(host = 'localhost', user= 'root', password='', database= 'medilab2')
        cursor = connection.cursor(pymysql.cursors.DictCursor)
        cursor.execute(sql, (invoice_no))
        count = cursor.rowcount
        # if it's found active, find the Nurse allocated 
        if count == 0:
            # Invoice does not exist in that table, allocate
            sql3 = '''insert into nurse_lab_allocations(nurse_id , invoice_no)values(%s,%s)'''
            cursor3 = connection.cursor()
            data = (nurse_id, invoice_no)
            cursor3.execute(sql3, data)
            connection.commit()
            # could we send an SMS to the nurse
            # Yes, Query using nurse_id to get the phone, decrypt it, 
            # Send text
            # Use Android Push Notifications - Firebase
            return jsonify({'message': 'Allocation Successful'})
        else:
            # It's found, what is the flag holding
            task = cursor.fetchone()
            flag = task['flag']

            if flag == 'Active':
                # task = cursor.fetchone()
                # Below ID belongs to current nurse allocated
                current_nurse_id = task['nurse_id']
                # Query Nurse table and get nurse details
                sql2 = '''select * from nurses where nurse_id = %s'''
                cursor2 = connection.cursor(pymysql.cursors.DictCursor)
                cursor2.execute(sql2, (current_nurse_id))
                # get nurse details
                nurse = cursor2.fetchone()
                surname = nurse['surname']
                others = nurse['others']
                message = '''Failed. Invoice No: {} Already Allocated to {} {}'''.format(invoice_no, surname, others)
                return jsonify({'message': message})
            elif flag == 'completed':
                return jsonify({'message': 'This Task is Marked as Completed'})
            elif flag == 'inactive':
                # can we activate it?
                return jsonify({'message': 'This Task is Marked as Inactive'})


                
        

