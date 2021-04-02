use Mix.Config

config :my_app, MyApp.Repo,
       url: to_string(:os.getenv('DB_URL')),
       basic_auth: [username: "neo4j", password: to_string(:os.getenv('DB_PASSWORD'))],
       pool_size: 10
