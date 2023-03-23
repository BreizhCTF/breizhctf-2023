#!/usr/bin/env python3
from flask import Flask, request, make_response, render_template, redirect, url_for
import jwt
import base64
import time

app = Flask(__name__)

FLAG = r"BZHCTF{JWThé_à_la_menthe}"
RSA_PUBLIC = open("public.pem").read()
RSA_PRIVATE = open("private.pem").read()

@app.route("/")
def index():
    try:
        sess = request.cookies.get("session", None)
        if sess is None:
            return render_template('index.html')
        token = jwt.decode(sess, RSA_PUBLIC, algorithms=["RS256", "HS256"])
        drinks = ["Frappuccino® Matcha", "Teavana™ - Matcha Green Tea Latte", "Teavana™ - Iced Matcha Green Tea Latte", "Teavana™ - Chai Tea Latte", "Teavana™ - Iced Chai Tea Latte", "Teavana™ - English Breakfast Tea", "Teavana™ - Hibiscus Tea", "Teavana™ - Emperor's Cloud Mist Tea", "Teavana™ - Mint Citrus Green Tea", "Refresha® Strawberry Açai", "Refresha® Very Berry", "Frappuccino® - Café Caramel", "Frappuccino® Coco Choco", "Caffè Latte", "Iced Latte", "Latte Macchiato", "Caramel Macchiato", "Iced Caramel Macchiato", "Cappuccino", "Iced Cappuccino", "Ristretto Bianco", "Cold Brew Latte", "Frappuccino® - Choco Chip"]
        drink = drinks[int(token.get("drink", '')) - 1]
        filtered_token = {
            "firstname": str(token.get("firstname", '')),
            "drink": drink,
            "size": str(token.get("size", '')),
            "toppings": str(token.get("toppings", '')),
            "note": str(token.get("note", '')),
            "role": str(token.get("role", ''))
        }
        return render_template('command.html', token=filtered_token)
    except Exception:
        dbg = base64.b64encode(request.cookies.get("session", "").encode()).decode()
        return render_template('400.html', debug=dbg), 400
    return render_template('index.html')

@app.route("/command", methods=["POST"])
def command():
    token = {
        "firstname": request.json.get("firstname", None),
        "drink": request.json.get("drink", None),
        "size": request.json.get("size", None),
        "toppings": request.json.get("toppings", None),
        "note": request.json.get("note", None),
        "role": "client",
        "iat": int(time.time())
    }
    encoded_jwt = jwt.encode(token, RSA_PRIVATE, algorithm="RS256")

    resp = make_response(render_template('command.html', token=token))
    resp.set_cookie('session', encoded_jwt)
    return resp

@app.route("/recettes")
@app.route("/recipes")
def admin():
    try:
        sess = request.cookies.get("session", None)
        token = jwt.decode(sess, RSA_PUBLIC, algorithms=["RS256", "HS256"])
        if token is None or "admin" not in token.get("role", '').lower():
            return render_template('403.html'), 403
        return render_template('flag.html', flag=FLAG)
    except Exception:
        return render_template('403.html'), 403
    return render_template('403.html'), 403

@app.route("/delete")
def delete():
    resp = make_response(redirect(url_for('index')))
    resp.set_cookie('session', '', expires=0)
    return resp

if __name__ == "__main__":
    app.run(debug=False)