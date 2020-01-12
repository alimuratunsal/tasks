from flask import Flask
app = Flask(__name__)


@app.route('/')
def hello():
    return "Welcome to my app"

@app.route('/status')
def status():
    return "",204

if __name__ == '__main__':
    #app.run()
    app.run(debug=True, host='0.0.0.0',port='8888')
