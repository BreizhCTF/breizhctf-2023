#!/usr/bin/env python3
import time
import os
import hashlib
from flask import Flask, jsonify, render_template, request, session
from flaskext.mysql import MySQL
from flask_session import Session
from flag import flag

app = Flask(__name__)
app.secret_key = os.getenv('SECRET_KEY', 'afa7d4906574ff95f07e8751f6e07e665f6fc2482f48e691729d714a343da83a')
app.config["MYSQL_DATABASE_HOST"] = os.getenv('MYSQL_HOST', 'bruzz-db')
app.config['MYSQL_DATABASE_USER'] = os.getenv('MYSQL_USER', 'dbuser')
app.config['MYSQL_DATABASE_PASSWORD'] = os.getenv('MYSQL_PASSWORD', 'userpass')
app.config['MYSQL_DATABASE_DB'] = os.getenv('MYSQL_DATABASE', 'bruzz')
app.config['SESSION_TYPE'] = 'filesystem'
app.config['SESSION_FILE_DIR'] = '/tmp/'

mysql = MySQL()
mysql.init_app(app)

Session(app)

@app.route('/')
def r_home():
    return render_template('home.html', title="Bruzz!")

@app.route('/register', methods=["POST"])
def r_register():
    try:
        session['name'] = str(request.get_json()["name"])
        return "Register"
    except:
        return "Register error.", 500

@app.route('/quizz', methods=["POST"])
def r_quizz():
    connection = mysql.connect()

    # try:
    rep = request.get_json()["responses"]
    score = 0
    if rep[0] == 0:
        score += 1
    if rep[1] == 2:
        score += 1
    if rep[2] == 1:
        score += 1
    if rep[3] == 3:
        score += 1
    
    # try:
    pseudo = session.get('name', '')
    with connection.cursor() as cursor:
        cursor.execute(f"SELECT count(*) FROM players WHERE username='{pseudo}'")
        nb = int(cursor.fetchone()[0])
    
    with connection.cursor() as cursor:
        sql = """INSERT INTO players (username, score) VALUES (%s, %s)"""
        cursor.execute(sql, (pseudo, "d"))

    connection.commit()

    rep = jsonify({
        "score": f"{score}/4",
        "msg": 'Ne vous aurais-je pas déjà vu ? Vous avez le même pseudo que <span id="spanscore">'+str(nb)+'</span> autre(s) joueur(s).'
    })
    # except Exception as e:
    #     rep = jsonify({
    #         "error": str(e),
    #         "sql": f"SELECT count(*) FROM players WHERE username='{pseudo}'"
    #     })

    connection.close()
    return rep
    # except Exception as e:
    #     return "Server error.", 500

@app.route('/score')
def r_score():
    score = request.form.get('score')
    if score:
        return "True"
    return "False"

@app.route('/logout')
def r_logout():
    session.clear()
    return ""

@app.route('/admin', methods=["GET", "POST"])
def r_admin():
    connection = mysql.connect()

    if request.method == "GET" and session.get('isadmin', False) is False:
        return render_template('login.html', title="Bruzz! - Login")
    elif request.method == "GET" and session.get('isadmin', False):
        return render_template('admin.html', title="Bruzz! - Administration", flag=flag)
    elif request.method == "POST":
        data = request.get_json()
        if "login" in data and "password" in data:
            login = str(data["login"])
            pwd = hashlib.sha1(str(data["password"]).encode()).hexdigest()
        with connection.cursor() as cursor:
            sql = "SELECT count(*) FROM administrateurs WHERE username = %s AND passwd = %s"
            cursor.execute(sql, (login, pwd))
            nb = cursor.fetchone()[0]
        if nb > 0:
            session["isadmin"] = True
        return str(nb)
    
    connection.close()
    return "Server error.", 500


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80, debug=False)
