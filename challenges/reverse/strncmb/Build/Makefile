CC = gcc

CFLAGS = -Wall -Wextra 

BIN = bin/
SRC = src/

STRNCMB = strncmb
STRNCMB_SRC = $(SRC)$(STRNCMB).c
TARGET = $(BIN)$(STRNCMB)

$(TARGET): $(STRNCMB_SRC) 
	@echo generate target $@ "=>"
	$(CC) $(CFLAGS) -o $@ $<
	@echo -------------------------

start : 
	@echo "Start building Challenge"
	@echo -------------------------
	@echo create necessary directory
	mkdir -p bin/
	@echo -------------------------

end : 
	@echo "Challenge has been build"

all: start $(TARGET) end

.PHONY: clean start end 

clean: 
	rm -f $(TARGET) $(STRNCMB_OBJ) 
