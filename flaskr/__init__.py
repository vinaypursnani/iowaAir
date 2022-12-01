from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from instance import dbCreds


# our application factory function
def create_app(test_config=None):
    # creating flask instance
    app = Flask(__name__, template_folder='../templates')
    # __name__ is the name of current python module, we use it to tell the app where current python module path. ???
    # the second parameter tells the app that all the config files are relative to instance folder and files located
    # outside flaskr folder won't be committed

    # setting default configuration for the app to use
    # like secret key to keep the data safe
    # database file path etc.
    app.config["SECRET_KEY"] = 'dev'
    app.config[
        "SQLALCHEMY_DATABASE_URI"] = f"mysql+pymysql://{dbCreds.username}:{dbCreds.password}@{dbCreds.hostname}/{dbCreds.database}"

    db = SQLAlchemy()
    db.init_app(app)

    from .auth import auth
    app.register_blueprint(auth)

    from .main import mainBP
    app.register_blueprint(mainBP)

    return app

# pip install flask-sqlalchemy
# pip install MySQL-python
