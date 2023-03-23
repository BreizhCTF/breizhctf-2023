CC = gcc

CFLAGS = -Wall -Wextra -masm=intel -fPIC
CCSYNTAX = -std=c11
LDFLAGS = -static  

BIN = bin/
SRC = src/

UEP = un_exchange_poly
UEP_SRC = $(SRC)$(UEP).c
UEP_HEAD = $(SRC)$(UEP).h
UEP_OBJ = $(BIN)$(UEP).o

GFO = get_function_offset
GFO_SRC = $(SRC)$(GFO).c
GFO_TARGET = $(BIN)$(GFO)

POLY_FILE = /tmp/poly_generation

TARGET = $(BIN)$(UEP)


$(UEP_OBJ): $(UEP_SRC) $(UEP_HEAD)
	@echo generate object file for $< "=>"
	$(CC)  $(CFLAGS) $(LDFLAGS) -c $< -o $@ 
	@echo -------------------------

$(TARGET): $(UEP_OBJ) 
	@echo generate target $@ "=>"
	$(CC) $(LDFLAGS) -o $@ $^ 
	@echo -------------------------

$(GFO_TARGET): $(GFO_SRC) 
	@echo generate target $@ "=>"
	$(CC) -Wall -Wextra -o $@ $^ -l elf
	@echo -------------------------

encrypt_challenge: 
	@echo "Encrypt $(TARGET)"
	@echo -------------------------
	@$(GFO_TARGET)	
	@echo -------------------------

strip_challenge:
	@echo "Strip $(TARGET)"
	@echo -------------------------
	@strip $(TARGET)	

start : 
	@echo "Start building Challenge"
	@echo -------------------------
	@echo create necessary directory
	mkdir -p bin/
	@echo -------------------------

end : 
	@echo "Challenge has been build"



all: start $(TARGET) $(GFO_TARGET) encrypt_challenge strip_challenge end

.PHONY: clean start end 

clean: 
	rm -f $(TARGET) $(UEP_OBJ) $(GFO_TARGET) $(POLY_FILE) 
