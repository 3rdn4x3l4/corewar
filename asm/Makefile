NAME = asm

SRC	=	op.c\
		asm.c\
		get_params.c\
		read.c\
		parse.c\
		parse_tools.c\
		parse_op_tool.c\
		set_label_op_params.c\
		param_tools.c\
		set_params.c\
		get_value.c\
		correct_values.c\
		write.c\
		print_stdout.c\
		write_file.c\

SRCS = $(addprefix srcs/,$(SRCS))

OBJDIR= out
OBJECT = $(addprefix $(OBJDIR)/,$(SRC:.c=.o))

LIBDIR = ../libft

LIBA = $(LIBDIR)/libft.a

INC_FLAG = -I includes
INC_FLAG += -I $(LIBDIR)/includes

LIB_FLAG = -L $(LIBDIR) -lft

CFLAGS = -Wall -Wextra -Werror 
#CFLAGS += -g3 -fsanitize=address,undefined
#CFLAGS += -g3 -fsanitize=thread,undefined 
#CFLAGS += -g3 -fsanitize=memory,undefined

CC = clang

BLUE = "\\033[36m"
RED = "\\033[31m"
WHITE = "\\033[0m"
GREEN = "\\033[32m"
PURPLE = "\\033[35m"

LNECLR = "\\33[2K\\r"

all: $(OBJDIR) $(NAME)

$(NAME): $(LIBA) $(OBJECT)
	$(CC) $(CFLAGS) $(INC_FLAG) -o $(NAME) $(OBJECT) $(LIB_FLAG)
	printf "$(LNECLR)$(GREEN)make asm done$(WHITE)\n"

$(LIBA): FORCE
	$(MAKE) -C $(LIBDIR)

$(OBJDIR):
	mkdir -p out

$(OBJDIR)/%.o: srcs/%.c includes/asm.h includes/op.h includes/manage_error.h
	printf "$(LNECLR)$(NAME): $<"
	$(CC) $(CFLAGS) $(INC_FLAG) -o $@ -c $<

clean:
	$(RM) -rf out
	$(MAKE) -C $(LIBDIR) clean
	printf "$(PURPLE)clean asm done$(WHITE)\n"

fclean:
	$(RM) -rf out $(NAME)
	$(MAKE) -C $(LIBDIR) fclean
	printf "$(PURPLE)fclean asm done$(WHITE)\n"

re:
	$(MAKE) -s fclean
	$(MAKE) -s all

.PHONY: all fclean clean re FORCE
.SILENT: clean fclean re $(NAME) $(OBJDIR) $(OBJECT) $(LIBA)
