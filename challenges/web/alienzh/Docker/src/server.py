#!/usr/bin/env python3

import os

from flask import Flask, send_file, jsonify
from flask_sqlalchemy import SQLAlchemy


basedir = os.path.abspath(os.path.dirname(__file__))

app = Flask(
    __name__,
    static_folder='static/assets',
    static_url_path='/assets',
)

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(basedir, 'database.db')

# Set up SQLAlchemy database
db = SQLAlchemy(app)


# Define employee model
class Employee(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(20))
    matricule = db.Column(db.String(40))
    citation = db.Column(db.String(300))

    def to_dict(self):
        return {
            'id': self.id,
            'name': self.name,
            'matricule': self.matricule,
            'citation': self.citation,
        }


# Serve index.html at root endpoint
@app.route('/')
def index():
    return send_file('static/index.html')


# Serve favicon
@app.route('/favicon.ico')
def favicon():
    return send_file('static/favicon.ico')


# Query employee by id and return JSON response
@app.route('/xyzapi/employee/<int:id>')
def get_employee(id):
    employee = Employee.query.get(id)
    if employee:
        return jsonify(employee.to_dict())
    else:
        return jsonify({'error': 'Employee not found'}), 404


if __name__ == '__main__':
    app.run()
