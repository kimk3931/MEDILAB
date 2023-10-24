# lab profile- view allocations
# nurse signin - lab signin
# View invoice Details - provide invoice no return tests under the invoice
# ViewInvoiceDetails - provide invoice_no return tests under that invoice


import pymysql
from flask_restful import*
from flask import*
from functions import*
import pymysql.cursors

from flask_jwt_extended import create_access_token,jwt_required,create_refresh_token


# NURSE LOGIN
class NurseSignin(Resource):
    @jwt_required(refresh=True)
    def post(self):
        json = request.json
        surname = json['surname']
        password = json['password']
        
        sql = 'select * from nurses where surname =%s '
        connection = pymysql.connect(host = 'localhost', user = 'root', password = '' , database = 'medilab2')
        cursor = connection.cursor(pymysql.cursors.DictCursor)
        cursor.execute(sql, surname)
        count = cursor.rowcount
        if count == 0:
            return jsonify ({'message': 'Surname does not exist'})
        else:
            nurse = cursor.fetchone()
            hashed_password = nurse['password']
            # Verify
            if hash_verify(password, hashed_password):
                # TODO JSON WEB TOKENS
                access_token = create_access_token(identity=surname,fresh=True)
                refresh_token = create_refresh_token(surname)

                return jsonify({'message': nurse, 'access_token': access_token, 'refresh_token':refresh_token})
            else:
                return jsonify({'message': 'Login Failed'})
            

#VIEW INVOICE_NO DETAILS
class ViewAssignment(Resource):
    @jwt_required(refresh=True)
    def post(self):
        json = request.json
        nurse_id = json['nurse_id']
        flag = json['flag']
        sql="select * from nurse_lab_allocations where nurse_id = %s and flag = %s"

        connection=pymysql.connect(host='localhost',user='root',password='',database='medilab2')

        cursor = connection.cursor(pymysql.cursors.DictCursor)
        cursor.execute(sql, (nurse_id, flag))
        count = cursor.rowcount
        if count == 0:
            message = "No {} Assignments" .format(flag)
            return jsonify({'message': 'No Assignments Given'})
        else:
            data = cursor.fetchall()
            return jsonify(data)
        

# VIEW INVOICE DETAILS
class ViewInvoiceDetails(Resource):
    @jwt_required(refresh=True)
    def post(self):
        json = request.json
        invoice_no = json['invoice_no']
        sql="select * from bookings where invoice_no = %s"

        connection=pymysql.connect(host='localhost',user='root',password='',database='medilab2')

        cursor = connection.cursor(pymysql.cursors.DictCursor)
        cursor.execute(sql, (invoice_no))
        count = cursor.rowcount
        if count == 0:
            message = "Invoice No {} Does Not Exist" .format(invoice_no)
            return jsonify({'message': message})
        else:
            bookings = cursor.fetchall()
            import json
            jsonStr = json.dumps(bookings, indent=1, sort_keys=True, default=str)
            return json.loads(jsonStr) 

# class ChangePass(Resource):
# #     # @jwt_required(refresh=True)
#     def post(self):
#         json = request.json
#         nurse_id = json['nurse_id']
#         current_password = json['current_password']
#         new_password = json['new_password']
#         confirm_password = json['confirm_password']
#         # Check if the new password and confirm password match
#         if new_password != confirm_password:
#             return "New password and confirm password do not match", 400

#         connection = pymysql.connect(host='localhost',user='root',password='',database='medilab2')
#         cursor = connection.cursor()

#         # Check if the nurse exists in the database
#         query = f"SELECT * FROM nurses WHERE nurse_id='{nurse_id}'"
#         cursor.execute(query)
#         result = cursor.fetchone()
#         if result is None:
#             return "Nurse does not exist", 400

#         # Check if the current password is correct
#         query = f"SELECT * FROM nurses WHERE nurse_id='{nurse_id}' AND password='{password}'"
#         cursor.execute(query)
#         result = cursor.fetchone()
#         if result is None:
#             return "Incorrect current password", 400

#         # Update the password
#         query = f"UPDATE nurses SET password='{new_password}' WHERE nurse_id='{nurse_id}'"
#         cursor.execute(query)
#         connection.commit()

#         return "Password updated successfully", 200
        

        # Select using the nurse id, if nurse does not exist, give a message
        # If nurse Exists get the hashed password
        # Verify if current password and hashed_password are OK
        # If current password is verified False, Give a message- current is wrong
        # If verified True, then confirm that new password and confirm are same.
        # If they are not same, Give a message
        # If they are same then, hash new_password and update under the nurse_id
        # Give a message password updated 
        # Go login with the new password


class ChangePass(Resource):
     def put(self):
          json = request.json
          nurse_id = json['nurse_id']
          current_password = json['current_password']
          new_password = json['new_password']
          confirm_password = json['confirm_password']
    
          sql = "select * from nurses where nurse_id = %s"
          connection = pymysql.connect(host='localhost',
                                                user='root',
                                                password='',
                                                database='medilab2')
          
          cursor = connection.cursor(pymysql.cursors.DictCursor)
          cursor.execute(sql, nurse_id)
          count = cursor.rowcount
          if count == 0:
                return jsonify({'message': 'Nurse does Not exist'})
          else:
               nurse = cursor.fetchone()
               hashed_password = nurse['password']   # This Password is hashed
                 # Jane provided a Plain password
               if hash_verify(current_password, hashed_password):
                       # You can Update
                       if new_password != confirm_password:
                            return jsonify({'message': 'Password Do Not match '})
                       else:
                            sql = '''Update nurses Set password = %s where nurse_id = %s'''
                            cursor = connection.cursor()
                            data = (hash_password(new_password),nurse_id)
                            try :
                                 cursor.execute(sql, data)
                                 connection.commit()
                                 return jsonify({'message': 'Password Changed '})
                            except:
                                 connection.rollback()
                                 return jsonify({'message':'Error in Changing the Password'})
               else:
                       return jsonify({'message': 'Current Password is Wrong '})







