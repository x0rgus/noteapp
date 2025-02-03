# Diretórios
FRONTEND_DIR=frontend
BACKEND_DIR=backend
VENV_DIR=env

# Comandos
PYTHON=python3
PIP=$(VENV_DIR)/bin/pip
NPM=npm

# Regras
.PHONY: all setup install_deps clean

all: setup

setup: venv install_deps

venv:
	@echo "Criando ambiente virtual..."
	@test -d $(VENV_DIR) || $(PYTHON) -m venv $(VENV_DIR)

install_deps:
	@echo "Instalando dependências do backend..."
	$(PIP) install -r requirements.txt
	@echo "Instalando dependências do frontend..."
	cd $(FRONTEND_DIR) && $(NPM) install

clean:
	@echo "Removendo ambiente virtual e dependências..."
	rm -rf $(VENV_DIR) $(FRONTEND_DIR)/node_modules
