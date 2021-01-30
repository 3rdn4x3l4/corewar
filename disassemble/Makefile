NAME		=		disassembler

LIBFT_A		=		libft/libft.a

INCLUDES	=		-Iinclude

SRCS		=		src/main.c				\
					src/op.c				\
					src/uint8file.c			\
					src/utils.c				\
					src/w_functions.c		\
					src/w_params.c


OBJ			=		$(SRCS:.c=.o)

CC			=		clang

CFLAGS		=		-Wall -Wextra -Werror

all			:		$(NAME)

$(LIBFT_A)	:	FORCE
	$(MAKE) -C libft

#	Original compilation line
#	$(CC) $(CFLAGS) $(LIBFT_A) $(OBJ) $(INCLUDES) -o $(NAME)
$(NAME)		:		$(OBJ) $(LIBFT_A)
	$(CC) $(CFLAGS) $(INCLUDES) $(OBJ) $(LIBFT_A) -o $(NAME)
	echo "disassembler created"

clean		:
	rm -rf $(OBJ)
	$(MAKE) -C libft/ clean
	echo "clean disassembler completed !"

fclean		:
	rm -rf $(NAME) $(LIBFT_A) $(OBJ)
	$(MAKE) -C libft/ fclean
	echo "fclean disassembler completed !"

re			:
	$(MAKE) -s fclean
	$(MAKE) -s all

FORCE		:


.PHONY		:		fclean clean re all
.SILENT		:		fclean clean re $(NAME) $(LIBFT_A) FORCE 
