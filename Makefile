all:
	mkdir -p /home/macote/data/wordpress
	mkdir -p /home/macote/data/mariadb
	cd srcs && docker compose up --build

stop:
	cd srcs && docker compose down

clean:
	rm -rf /home/macote/data/wordpress
	rm -rf /home/macote/data/mariadb

fclean: clean
	

re: clean all

.PHONY: all clean fclean re
