from flask import Flask, render_template, request, escape, session
from vsearch import search4letters

app = Flask(__name__)

@app.route('/login')
def do_login() -> str:
    session['logged in'] = True
    return "you are now logged in"

@app.route('/logout')
def do_logout() -> str:
    session.pop('logged in')
    return "You are now logged out"

@app.route('/status')
def check_status() -> str:
    if 'logged in' in session:
        return "you are logged in"
    return "you are not logged in"

app.secret_key = "you will never log in"

def check_logged_in() ->bool:
    if 'logged_in' in session:
        return True
    return False

@app.route('/page1')
def page1() -> str:
    if not check_logged_in():
        return "you are not logged in"
    return "This is page 1"

if __name__ == '__main__':
    app.run(debug=True)
