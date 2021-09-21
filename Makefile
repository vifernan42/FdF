# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vifernan <vifernan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/06 19:47:29 by vifernan          #+#    #+#              #
#    Updated: 2021/09/21 17:15:58 by vifernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= fdf

CFLAGS	= -Wall 
LINK	= -lmlx -framework OpenGL -framework AppKit
SRCS	= 	ft_drw.c \
			ft_fdf.c \
			get_next_line.c \

OBJS	= $(SRCS:.c=.o)
CC		= 	gcc
INCLUDES = -I./includes

all: $(NAME)

BCyan = \033[1;36m 
GREEN = \033[0;32m
Yellow = \033[0;33m
Red = \033[0;31m
NO_COLOR = \033[0m

$(NAME): $(OBJS)
	@$(MAKE) -C ./libft
	@$(CC) $(CFLAGS) libft/libft.a $(OBJS) $(LINK) -o $(NAME)
	@echo "$(GREEN)[COMPILED]$(NO_COLOR)"

clean:
	rm -rf $(OBJS)
	@$(MAKE) fclean -C ./libft
	@echo "$(Yellow)[CLEAN]$(NO_COLOR)"

fclean: clean
	rm -rf $(NAME)
	@echo "$(Red)[FCLEAN]$(NO_COLOR)"
	
re: fclean all

test: all
	@echo "$(BCyan)[RESULTS]$(NO_COLOR)"
	@./fdf test_maps_3/pyramide.fdf

.PHONY: all clean fclean re bonus test