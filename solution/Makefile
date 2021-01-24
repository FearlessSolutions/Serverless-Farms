deploy:
	cd infrastructure && serverless deploy -s $(s)
	cd backend && serverless deploy -s $(s)

remove:
	cd infrastructure && serverless remove -s $(s)
	cd backend && serverless remove -s $(s)