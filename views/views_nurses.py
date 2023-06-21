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