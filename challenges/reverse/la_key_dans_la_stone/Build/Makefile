CC = gcc

CFLAGS = -Wall -Wextra 
CCSYNTAX = -std=c11
LDFLAGS = -static  

BIN = bin/
SRC = src/

LIBS = libs/
KDS = la_key_dans_la_stone
KDS_SRC = $(SRC)$(KDS).c
KDS_HEAD = $(SRC)$(KDS).h
KDS_OBJ = $(BIN)$(KDS).o

CPS = check_password_shellcode
SHELLCODE_SRC = $(SRC)$(CPS).s
SHELLCODE_BIN = $(BIN)$(CPS)
SHELLCODE_OBJ = $(SHELLCODE_BIN).o

TARGET = $(BIN)$(KDS)

# Shellcode segfault because of ret use (patch use syscall exit) 
shellcode:
	nasm -felf64 $(SHELLCODE_SRC) -o $(SHELLCODE_OBJ) 
	ld $(SHELLCODE_OBJ) -o $(SHELLCODE_BIN) 


$(KDS_OBJ): $(KDS_SRC) $(KDS_HEAD)
	@echo generate object file for $< "=>"
	$(CC) $(CFLAGS) $(LDFLAGS) -c $< -o $@ 
	@echo -------------------------

$(TARGET): $(KDS_OBJ) 
	@echo generate target $@ "=>"
	$(CC) $(LDFLAGS) -o $@ $^ -L$(LIBS) -lkeystone -lstdc++ -lm
	@echo -------------------------

start : 
	@echo "Start building Challenge"
	@echo -------------------------
	@echo create necessary directory
	mkdir -p bin/
	@echo -------------------------

end : 
	@echo "Challenge has been build"

all: start $(TARGET) shellcode end

.PHONY: clean start end 

clean: 
	rm -f $(TARGET) $(KDS_OBJ) $(SHELLCODE_BIN) $(SHELLCODE_OBJ)
