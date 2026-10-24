.PHONY: lint

lint:
	flake8 app --select=WPS
