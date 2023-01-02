.PHONY:
	all clean fclean re prune

all:
	mkdir -p /home/pweinsto/data/mariadb
	mkdir -p /home/pweinsto/data/wordpress
	docker-compose --env-file ./srcs/.env -f ./srcs/docker-compose.yml up --build -d

clean:
	docker-compose -f ./srcs/docker-compose.yml down

fclean:
	docker-compose -f ./srcs/docker-compose.yml down --volumes --rmi all
	sudo rm -rf /home/pweinsto/data/mariadb
	sudo rm -rf /home/pweinsto/data/wordpress

re: fclean all

prune:
	docker system prune -a -f