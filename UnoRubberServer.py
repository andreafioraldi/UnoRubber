#!/usr/bin/env python

from flask import *

app = Flask(__name__)

output = ""
waiting_cmd = ""

@app.route('/')
def index_page():
    return render_template("shell.html", output=output) 

@app.route('/set_cmd')
def set_cmd():
    global output, waiting_cmd
    c = request.args.get("cmd", "")
    if c != "":
        waiting_cmd = c
        output = output + c + "\n"
    return redirect("/")

@app.route('/get_cmd')
def get_cmd():
    global waiting_cmd
    r = waiting_cmd
    waiting_cmd = ""
    return r

@app.route('/reset')
def reset():
    global output, waiting_cmd
    output = ""
    waiting_cmd = None
    return redirect("/")

@app.route('/update_output/', methods=['POST'])
def update_output():
    global output
    output = output + request.form['output']
    #return redirect("/")
    return "DONE"
