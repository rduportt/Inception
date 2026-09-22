*This project has been created as part of the 42 curriculum by rduport*

-Description
    Inception is a project where we familiarize with the docker environnement. This project consists of having you set up a small infrastructure composed of different
    services under specific rule. Docker is a software platform that packages an application and all its dependencies into a single, standardized unit called a container.
    Unlike a Virtual Machine Docker doesnt have to create a kernel it uses the one on the machine.
    Environment variables handle general application configuration, while secrets specifically store sensitive credentials that grant system access.
    The difference between Docker network (bridge in this project) is that bridge networking isolates the container’s network stack from the host, while host networking bypasses isolation, forcing the container to share the host's network namespace directly.
    The Docker volume are managed by Docker and stored in Docker own storage area. they are easier to manage and better suited for databases. Bind mounts directly link a specific directory or file on the host machine to a container. In this project we used Docker Volumes for persistent mariaDB and Wordpress data because Docker manages their lifecycle and the data survives container recreation.


-Installation and execution
    To install and execute the project simply clone the project, then create en .env file in the srcs directory with your values :

    SQL_DATABASE=
    SQL_USER=

    WP_TITLE=
    WP_ADMIN_USER=
    WP_ADMIN_EMAIL=

    WP_USER=
    WP_USER_EMAIL=


    Create a folder secrets at the root of the repository and create the following files and fill them up with whatever you want :

    - db_password.txt
    - db_root_password.txt
    - wp_admin_password.txt
    - wp_user_password.txt

    and then you can use "make" at the root

-Ressources
    I used the ReadMe of these repo to help me set up my vm and some definitions of docker :
    https://github.com/vbachele/Inception
    https://github.com/llescure/42_Inception

    And use this tutorial (outdated) to guide me trough the setup of Docker :
    https://inception.cluzet.fr/

    The official Documentation site of Docker to fill the gaps :
    https://docs.docker.com/

    I used AI to guide me trough the debug part of the project

• A Project description section must also explain the use of Docker and the sources
included in the project. It must indicate the main design choices, as well as a
comparison between:
◦ Virtual Machines vs Docker
◦ Secrets vs Environment Variables
◦ Docker Network vs Host Network
◦ Docker Volumes vs Bind Mounts
