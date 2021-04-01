---
to: backend/postman/PresignedPostTest.postman_collection.json
---
{
	"info": {
		"_postman_id": "e4893b80-6f84-4244-a72e-01d2c237fc55",
		"name": "PreSignedPost Tests",
		"schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
	},
	"item": [
		{
			"name": "GET presigned post",
			"event": [
				{
					"listen": "test",
					"script": {
						"exec": [
							"pm.test(\"Export Response Values\", function () {",
							"    var jsonData = pm.response.json();",
							"    // set the field values into the environment",
							"    Object.keys(jsonData.fields).forEach(key=>{",
							"        pm.environment.set(key, jsonData.fields[key]);",
							"    })",
							"    pm.environment.set(\"url\", jsonData.url);",
							"    ",
							"});",
							"",
							"pm.test(\"Status code name has string\", function () {",
							"    pm.response.to.have.status(\"OK\");",
							"});",
							"",
							"pm.test(\"Status code is 200\", function () {",
							"    pm.response.to.have.status(200);",
							"});",
							"pm.test(\"Response has expected values\", function () {",
							"    var jsonData = pm.response.json();",
							"    pm.expect(jsonData.url).to.not.be.null",
							"    pm.expect(jsonData.fields.acl).to.not.be.null",
							"    pm.expect(jsonData.fields.key).to.not.be.null",
							"    pm.expect(jsonData.fields.AWSAccessKeyId).to.not.be.null",
							"    pm.expect(jsonData.fields['x-amz-security-token']).to.not.be.null",
							"    pm.expect(jsonData.fields.policy).to.not.be.null",
							"    pm.expect(jsonData.fields.signature).to.not.be.null",
							"",
							"});"
						],
						"type": "text/javascript"
					}
				}
			],
			"request": {
				"method": "GET",
				"header": [],
				"url": {
					"raw": "{{host}}/presignedPost?fileName=testFile.txt",
					"host": [
						"{{host}}"
					],
					"path": [
						"presignedPost"
					],
					"query": [
						{
							"key": "fileName",
							"value": "testFile.txt"
						}
					]
				}
			},
			"response": []
		}
	]
}