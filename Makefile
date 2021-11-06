run:
	git add .
	git commit -m update
	@echo $(value token)
	git push origin