from flask import session
def check_logged_in(func):
    def wrapper():
        if 'logged_in' in session:
            return func()
        return 'you are not logged in'
    return wrapper()