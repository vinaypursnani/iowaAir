from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from instance import dbCreds

# our application factory function
def create_app(test_config=None):
    # creating flask instance
    app = Flask(__name__, instance_relative_config=True)
    # __name__ is the name of current python module, we use it to tell the app where current python module path. ???
    # the second parameter tells the app that all the config files are relative to instance folder and files located
    # outside flaskr folder won't be committed

    # setting default configuration for the app to use
    # like secret key to keep the data safe
    # database file path etc.
    app.config.from_mapping(
        SECRET_KEY='dev',
        SQLALCHEMY_DATABASE_URI=f'mysql+pymysql://{dbCreds.username}:{dbCreds.password}@{dbCreds.hostname}/{dbCreds.database} '
    )

    db = SQLAlchemy(app)

    if test_config is None:
        # used to override default app configurations with the one's present in the instance folder of this app
        app.config.from_pyfile('config.py', silent=True)
        # to use the configuration file from testing environment
    else:
        app.config.from_mapping(test_config)

    @app.route('/')
    def index():
        return "Default Route: Index Page"

    return app

# pip install flask-sqlalchemy
# pip install MySQL-python
