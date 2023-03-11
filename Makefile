DK_COM = sudo docker compose -p inception -f srcs/docker-compose.yml
MB_VM_DIR = /home/yoseo/data/mariadb
WP_VM_DIR = /home/yoseo/data/wordpress
VM_DIRS = $(MB_VM_DIR) $(WP_VM_DIR)

all: up

$(MB_VM_DIR):
	mkdir -p $(MB_VM_DIR)

$(WP_VM_DIR):
	mkdir -p $(WP_VM_DIR)

start:
	$(DK_COM) start

stop:
	$(DK_COM) stop

restart:
	$(DK_COM) restart

up: 	$(VM_DIRS)
	$(DK_COM) up --detach --build

#remvoe Resource
clean:
	$(DK_COM) down --rmi all --volumes

fclean: clean
	sudo rm -rf /home/yoseo/data/*
re: fclean all
