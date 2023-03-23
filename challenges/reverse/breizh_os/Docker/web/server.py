import os
from flask import Flask, flash, request, redirect, url_for, render_template
from werkzeug.utils import secure_filename
import uuid

UPLOAD_FOLDER = '/tmp/'
FILENAME = "program"

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.route('/', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        # check if the post request has the file part
        if 'file' not in request.files:
            flash('No file part')
            return redirect(request.url)
        file = request.files['file']
        if file.filename == '':
            flash('No selected file')
            return redirect(request.url)
        # First, garbage collector with max 5 minutes
        cmd = r"find /tmp/ -type d -mmin +5 -type d -mindepth 1 -maxdepth 1 -exec rm -rf {} \;"
        os.system(cmd)
        # Then, make a copy of BreizhOS VM
        folder = str(uuid.uuid1())
        full_folder = app.config['UPLOAD_FOLDER'] + folder
        os.mkdir(full_folder)
        os.system(f"cp -r /breizhOS/* {full_folder}/")
        # Finally save new binary and execute the VM
        file.save(f"{full_folder}/bin/{FILENAME}")
        os.system(f"cd {full_folder} && /usr/bin/make link && ./emulate.sh img/breizhOS.img")
        # Result is stored in result.log, we just need to redirect
        return redirect(f"/{folder}")
    return render_template("index.html")

@app.route('/<bin_uuid>')
def process_file(bin_uuid):
    try:
        uuid_obj = uuid.UUID(bin_uuid, version=1)
    except ValueError:
        return redirect('/')
    if os.path.exists(f"{UPLOAD_FOLDER}/{bin_uuid}"):
        try:
            results = open(f"{UPLOAD_FOLDER}/{str(uuid_obj)}/result.log").read()
        except:
            results = "Erreur ! Le fichier envoyé est certainement incorrect."
        return render_template("results.html", results=results)
    return redirect(url_for('upload_file'))

if __name__ == "__main__":
    app.run(debug=False)
