# from flask import Flask, render_template, request,escape
# from vsearch import search4letters
#
# app = Flask(__name__)


#
#
# @app.route('/search4', methods=['POST'])
# def do_search() -> 'html':
#     phrase = request.form['phrase']
#     letters = request.form['letters']
#     title = 'results'
#     results = str(search4letters(phrase, letters))
#     return render_template('results.html',
#                            the_phrase=phrase,
#                            the_letters=letters,
#                            the_title=title,
#                            the_results=results,)
#
# @app.route('/')
# @app.route('/entry')
# def entry_page() -> 'html':
#     return render_template('entry.html',
#                            the_title='search4letter web')
#
# @app.route('/viewlog')
# def view_the_log() -> 'html':
#     contents = []
#     with open('vsearch.log') as log:
#         for line in log:
#             contents.append([])
#             for item in line.split('|'):
#                 contents[-1].append(escape(item))
#     titles = ('Form Data', 'Remote_addr','User_agent', 'Results')
#     return render_template('viewlog.html',
#                            the_title = 'View Log',
#                            the_row_titles = titles,
#                            the_data = contents)
#
# if __name__=='__main__':
#     app.run(debug=True)


from flask import Flask, render_template, request, escape, session
from flask import copy_current_request_context
from vsearch import search4letters

from DBcm import UseDatabase, ConnectionError, CredentialsError, SQLError
from checker import check_logged_in
from threading import Thread
from time import sleep

app = Flask(__name__)

app.config['dbconfig'] = {'host': '127.0.0.1',
            'user': 'root',
            'password': 'Pa$$w0rd',
            'database': 'vsearchlogdb' }


@app.route('/login')
def do_login() -> str:
    session['logged_in'] = True
    return 'You are logged in'


@app.route('/logout')
def do_logout() -> str:
    session.pop('logged_in')
    return 'You are logged out'

@app.route('/search4', methods=['POST'])
def do_search() -> 'html':
    @copy_current_request_context
    def log_request(req: 'flask_request',res:str) -> None:
        sleep(15)
        with UseDatabase(app.config['dbconfig']) as cursor:
            _SQL = """insert into log
                            (phrase, letters, ip, browser_string, results)
                            values
                            (%s,%s,%s,%s,%s)"""
            cursor.execute(_SQL,(req.form['phrase'],
                                req.form['letters'],
                                req.remote_addr,
                                str(req.user_agent),
                                res,))
    phrase = request.form['phrase']
    letters = request.form['letters']
    title = 'Here are your results:'
    results = str(search4letters(phrase, letters))
    try:
        t = Thread(target=log_request,args=(request,results))
        t.start()
    except Exception as err:
        print('***** Logging failed with this error:', str(err))
    return render_template('results.html',
                           the_title=title,
                           the_phrase=phrase,
                           the_letters=letters,
                           the_results=results,)

@app.route('/')
@app.route('/entry')
def entry_page() -> 'html':
    return render_template('entry.html', the_title='Welcome to search4letters on the web!')

@app.route('/viewlog')
@check_logged_in
def view_the_log() -> 'html':
    try:
        with UseDatabase(app.config['dbconfig']) as cursor:
            _SQL = """select phrase, letters, ip, browser_string, results from log"""
            cursor.execute(_SQL)
            contents = cursor.fetchall()
            titles = ('Phrase','Letters','Remote_addr','User_agent','Results')
            return render_template('viewlog.html',
                                   the_title='View Log',
                                   the_row_titles = titles,
                                   the_data = contents,)
    except ConnectionError as err:
        print('switch on your db. Error: ', str(err))
    except CredentialsError as err:
        print('User id/ password is incorrect. Error: ', str(err))
    except Exception as err:
        print('something went wrong:', str(err))
    return 'Error'


app.secret_key = 'YouWillNeverGuessMySecretKEY'

if __name__ == '__main__':
    app.run(debug=True)




# from flask import Flask, render_template, request, escape, session
# from flask import copy_current_request_context
# from vsearch import search4letters
#
# from DBcm import UseDatabase, ConnectionError, CredentialsError, SQLError
# from checker import check_logged_in
# from threading import Thread
# from time import sleep
#
# app = Flask(__name__)
#
#
# def log_request(req: 'flask_request',res: str) -> None:
#     dbconfig = {'host': '127.0.0.1',
#                 'user': 'root',
#                 'password': 'Pa$$w0rd',
#                 'database': 'vsearchlogdb'
#                  }
#     import mysql.connector
#     conn = mysql.connector.connect(**dbconfig)
#     cursor = conn.cursor()
#     _SQL = """insert into log
#                         (phrase,letters,ip,browser_string,results)
#                         values
#                         (%s,%s,%s,%s,%s)"""
#     cursor.execute(_SQL, (req.form['phrase'],
#                            req.form['letters'],
#                            req.remote_addr,
#                            str(req.user_agent.browser),
#                            res,))
#     conn.commit()
#     cursor.close()
#     conn.close()
# @app.route('/search4', methods=['POST'])
# def do_search() -> 'html':
#     phrase = request.form['phrase']
#     letters = request.form['letters']
#     title = 'Here are your results:'
#     results = str(search4letters(phrase, letters))
#     log_request(request, results)
#     return render_template('results.html',
#                            the_title=title,
#                            the_phrase=phrase,
#                            the_letters=letters,
#                            the_results=results,)
#
#
#
# @app.route('/')
# @app.route('/entry')
# def entry_page() -> 'html':
#     return render_template('entry.html',
#                            the_title='Welcome to search4letters on the web!')
#
# @app.route('/viewlog')
# def view_the_log() -> 'html':
#     contents = []
#     with open('vsearch.log') as log:
#         for line in log:
#             contents.append([])
#             for item in line.split('|'):
#                 contents[-1].append(escape(item))
#     titles = ('Form Data', 'Remote_addr', 'User_agent', 'Results')
#     return render_template('viewlog.html', the_title='Viev Log', the_row_titles=titles,the_data=contents)
#
# if __name__ == '__main__':
#     app.run(debug=True)
#
