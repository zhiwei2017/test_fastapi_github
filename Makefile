SOURCE_DIR = ./test_fastapi_github

.PHONY: clean help

help:
	clear;
	@echo "================= Usage =================";
	@echo "clean                  : Remove autogenerated folders and artifacts.";
	@echo "clean-pyc              : Remove python artifacts."
	@echo "clean-build            : Remove build artifacts."
	@echo "bandit                 : Install and run bandit security analysis.";
	@echo "mypy                   : Install and run mypy type checking.";
	@echo "flake8                 : Install and run flake8 linting.";
	@echo "test                   : Run tests and generate coverage report.";

# Clean the folder from build/test related folders
clean: clean-build clean-pyc
	rm -rf .mypy_cache/
	rm -rf .pytest_cache/
	rm -f .coverage

clean-pyc:
	find . -name '*.pyc' -exec rm -rf {} +
	find . -name '*.pyo' -exec rm -rf {} +

clean-build:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info

# Install and run bandit security analysis
bandit:
	python3 -m pip install bandit
	python3 -m bandit -r $(SOURCE_DIR)

# Install and run mypy type checking
mypy:
	python3 -m pip install -r requirements/dev.txt
	python3 -m pip install mypy
	python3 -m mypy $(SOURCE_DIR)

# Install and run flake8 linting
flake8:
	python3 -m pip install flake8
	python3 -m flake8 $(SOURCE_DIR)

# Install requirements for testing and run tests
test:
	python3 -m pip install -r requirements/dev.txt
	python3 -m pip install -e .
	python3 -m pytest