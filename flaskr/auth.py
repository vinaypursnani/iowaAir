from flask import Blueprint, flash, redirect, render_template, request, session, url_for
from werkzeug.security import check_password_hash, generate_password_hash

auth = Blueprint('auth', __name__)


@auth.route('/login')
def login():
    return 'Login'


@auth.route('/signuo')
def signup():
    return 'Signup'


@auth.route('/logout')
def logout():
    return 'Logout'
