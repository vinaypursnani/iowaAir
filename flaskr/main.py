from flask import Blueprint

mainBP = Blueprint('main', __name__)


@mainBP.route('/')
def index():
    return "Default Route: Index Page"


@mainBP.route('/profile')
def profile():
    return "User Profile"
