from flask import Blueprint, flash, redirect, render_template, request, session, url_for
from werkzeug.security import check_password_hash, generate_password_hash

bp = Blueprint('auth', __name__, url_prefix='/auth')

bp.route('/register', methods=('GET', 'POST'))


def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
