CC = gcc

CFLAGS = -Wall -Wextra -masm=intel 
CCSYNTAX = -std=c11
LDFLAGS = -static -s 

BIN = bin/
SRC = src/

LIBS = libs/
KEY = keystone 
CAP = capstone
LIB_KEY = $(LIBS)$(KEY)
LIB_CAP = $(LIBS)$(CAP)

COS = cap_ou_stone
COS_SRC = $(SRC)$(COS).c
COS_HEAD = $(SRC)$(COS).h
COS_OBJ = $(BIN)$(COS).o

TARGET = $(BIN)$(COS)

$(COS_OBJ): $(COS_SRC) $(COS_HEAD)
	@echo generate object file for $< "=>"
	$(CC) $(CFLAGS) $(LDFLAGS) -c $< -o $@ 
	@echo -------------------------

$(TARGET): $(COS_OBJ) 
	@echo generate target $@ "=>"
	$(CC) $(LDFLAGS) -o $@ $^ -L$(LIB_KEY) -l$(KEY) -L$(LIB_CAP) -l$(CAP) -lstdc++ -lm
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
	rm -f $(TARGET) $(COS_OBJ) 
