# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: plagache <plagache@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/21 21:06:39 by plagache          #+#    #+#              #
#    Updated: 2020/07/01 15:17:23 by alagache         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

VM = vm/
ASM = asm/
DASM = disassemble/


all:
	$(MAKE) -s -C $(VM)
	$(MAKE) -s -C $(ASM)
	$(MAKE) -s -C $(DASM)

clean: 
	$(MAKE) -s -C $(VM) clean
	$(MAKE) -s -C $(ASM) clean
	$(MAKE) -s -C $(DASM) clean

fclean:
	$(MAKE) -s -C $(VM) fclean
	$(MAKE) -s -C $(ASM) fclean
	$(MAKE) -s -C $(DASM) fclean

re:
	$(MAKE) -s fclean
	$(MAKE) -s all

vm:
	$(MAKE) -s -C $(VM)

clean_vm:
	$(MAKE) -s -C $(VM) clean

fclean_vm:
	$(MAKE) -s -C $(VM) fclean

asm:
	$(MAKE) -s -C $(ASM)

clean_asm:
	$(MAKE) -s -C $(ASM) clean

fclean_asm:
	$(MAKE) -s -C $(ASM) fclean

dasm:
	$(MAKE) -s -C $(DASM)

clean_dasm:
	$(MAKE) -s -C $(DASM) clean

fclean_dasm:
	$(MAKE) -s -C $(DASM) fclean

.PHONY: all clean fclean re vm asm dasm clean_vm clean_asm clean_dasm fclean_vm fclean_asm fclean_dasm
.SILENT:
