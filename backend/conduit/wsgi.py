import connexion

app = connexion.FlaskApp(__name__, specification_dir='swagger/')
app.add_api('swagger.yaml')


if __name__ == '__main__':
    app.run(port=8080)
