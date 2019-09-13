# Achievements App

# Run with docker

To run with docker you need first to start the *ElasticSearch* service.
```sh
sudo docker-compose up -d elasticsearch
```

The database can be populated by running the seeds.
```sh
sudo docker-compose run rails-server rake db:seed
```

After running it you need to wait for the database to be populated.

Next, start rails and mongo services using the following command:

```sh
sudo docker-compose up -d rails
```

Wait for the *Rails* service finish starting. After it, you can access it at your browser on `localhost:3000`.
