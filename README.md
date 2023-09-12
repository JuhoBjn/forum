# Forum

Forum is a full-stack web project I'm making to improve my skills with web-development. The idea is to implement a simple online forum with user accounts and the ability for users to create posts, vote and comment on them.

### Technical stack

* Backend: Node.js, Express.js, MySQL
* Frontend: React.js
* Local development: Docker

## Running the project locally

### Backend

> To run this project locally you will need to have Docker Desktop installed on your computer.
>
> If you have it installed, go ahead and start it up now.
>
> Installation instructions can be found on the [Docker Website](https://www.docker.com/get-started/)

* Create a file with name `.env` in the root of the project following the template below. Replace placeholder values with your own.
```
MYSQL_DATABASE=<your-database-name-here>
MSYQL_ROOT_PASSWORD=<your-root-password-here>
```
* Start up the database containers by issuing the command `docker compose up -d`
* Navigate to the `/backend` folder
* Issue command `npm install` to install necessary Node modules
* Run `npm run start`

Now, the backend of the project should be up and running. The database will be available at `localhost:3306` and the Adminer database management console will be available at `localhost:8080`.


### Frontend

* Navigate to the `frontend` folder of the project
* Install necessary Node modules with `npm install`
* Run `npm run start` to start up the frontend server

The website should now be available in the address displayed on your terminal.


## Deployment

The project will be deployed on Render once it reaches it's first usable state.
