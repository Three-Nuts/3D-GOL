NAME		=	3d-gol

#----- HEADER -----
H_DIR	=	include
H		=	$(H_DIR)/main.hpp

#----- SRC ----
SRC_DIR	=	src
SRC		=	$(SRC_DIR)/main.cpp

#----- OBJ -----
OBJ		=	$(SRC:.cpp=.o)

#----- FLAGS -----
CC			=	c++
H_FLAGS		=	-I$(H_DIR)
C_FLAGS		=	-std=c++98 -Wall -Wextra -Werror

######################################################
#                       DARWIN                       #
######################################################
ifeq ($(shell uname -s), Darwin)
LIB_FLAGS	=	-framework OpenGL \
				-L/opt/homebrew/Cellar/glew/2.2.0_1/lib/ \
				-lGLEW \
				-L/opt/homebrew/Cellar/glfw/3.3.8/lib/ \
				-lglfw
H_FLAGS		+=	-I/opt/homebrew/Cellar/glew/2.2.0_1/include/ \
				-I/opt/homebrew/Cellar/glfw/3.3.8/include/
endif
######################################################
#                       LINUX                        #
######################################################
ifeq ($(shell uname -s), Linux)
LIB_FLAGS	=
H_FLAGS		=
endif

#----- IMPICIT RULES -----
$(addprefix $(SRC_DIR)/, %.o):	$(addprefix $(SRC_DIR)/, %.cpp) $(H)
	$(CC) $(H_FLAGS) $(C_FLAGS) -c $< -o $@

#----- RULES
all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(H_FLAGS) $(LIB_FLAGS) $(OBJ) -o $@

clean:
	$(RM) -rf $(OBJ)

fclean: clean
	$(RM) -rf $(OBJ)
	$(RM) $(NAME)

re: fclean all

#----- UTILS -----
RED				=	\033[0;31m
CYAN			=	\033[0;36m
GREEN 			=	\033[1;32m
YELLOW 			=	\033[1;33m
NC 				=	\033[0m

.PHONY: clean fclean re all
