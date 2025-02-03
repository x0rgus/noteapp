# Diretórios
FRONTEND_DIR=frontend
BACKEND_DIR=backend
VENV_DIR=env

# Comandos
PYTHON=python3
PIP=$(VENV_DIR)/bin/pip
NPM=npm

# Regras
.PHONY: all setup install_deps clean create_env_file

all: setup

setup: venv install_deps create_env_file

venv:
	@echo "Criando ambiente virtual..."
	@test -d $(VENV_DIR) || $(PYTHON) -m venv $(VENV_DIR)

install_deps:
	@echo "Instalando dependências do backend..."
	$(PIP) install -r requirements.txt
	@echo "Instalando dependências do frontend..."
	cd $(FRONTEND_DIR) && $(NPM) install

create_env_file:
	@echo "Criando arquivo .env no frontend..."
	@test -d $(FRONTEND_DIR) || (echo "A pasta $(FRONTEND_DIR) não existe!" && exit 1)
	@test -f $(FRONTEND_DIR)/.env || (echo "VITE_API_URL=http://localhost:8000" > $(FRONTEND_DIR)/.env && echo ".env criado com sucesso.")
	@cat $(FRONTEND_DIR)/.env || echo "Falha na criação do arquivo .env"

clean:
	@echo "Removendo ambiente virtual e dependências..."
	rm -rf $(VENV_DIR) $(FRONTEND_DIR)/node_modules
