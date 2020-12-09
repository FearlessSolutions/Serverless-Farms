---
to: backend/postman/<%= h.changeCase.lower(name) %>.postman_collection.json
---
{
	"info": {
		"_postman_id": "5b660c57-d196-40f5-8ffb-fc719f2e1f2c",
		"name": "PY-REST-API",
		"schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
	},
	"item": [
		{
			"name": "POST create",
			"event": [
				{
					"listen": "test",
					"script": {
						"id": "a1e3e845-73de-498c-bfbd-93e39c433734",
						"exec": [
							"pm.test(\"Status test\", function () {",
							"    pm.response.to.have.status(200);",
							"    const responseJson = pm.response.json();",
							"    pm.environment.set(\"id\", responseJson.id);",
							"});"
						],
						"type": "text/javascript"
					}
				}
			],
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": "{\n    \"foo\": \"foo\",\n    \"bar\": \"bar\"\n}",
					"options": {
						"raw": {
							"language": "json"
						}
					}
				},
				"url": {
					"raw": "{{host}}/{{model}}",
					"host": [
						"{{host}}"
					],
					"path": [
						"{{model}}"
					]
				}
			},
			"response": []
		},
		{
			"name": "GET list",
			"event": [
				{
					"listen": "prerequest",
					"script": {
						"id": "0f123e65-d9dc-4caa-99bd-e74b560c109b",
						"exec": [
							""
						],
						"type": "text/javascript"
					}
				},
				{
					"listen": "test",
					"script": {
						"id": "ea8adb9d-7229-4428-8ebc-c5ece0269b40",
						"exec": [
							"pm.test(\"Status test\", function () {",
							"    pm.response.to.have.status(200);",
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
					"raw": "{{host}}/{{model}}",
					"host": [
						"{{host}}"
					],
					"path": [
						"{{model}}"
					]
				}
			},
			"response": []
		},
		{
			"name": "GET get {id}",
			"event": [
				{
					"listen": "test",
					"script": {
						"id": "18d5b377-7a33-4de1-a26e-5d67a86fce7d",
						"exec": [
							"pm.test(\"Status test\", function () {",
							"    pm.response.to.have.status(200);",
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
					"raw": "{{host}}/{{model}}/{{id}}",
					"host": [
						"{{host}}"
					],
					"path": [
						"{{model}}",
						"{{id}}"
					]
				}
			},
			"response": []
		},
		{
			"name": "PUT update {id}",
			"event": [
				{
					"listen": "test",
					"script": {
						"id": "a53da622-abe4-4b90-bd72-1cb6308b15fc",
						"exec": [
							"pm.test(\"Status test\", function () {",
							"    pm.response.to.have.status(200);",
							"});"
						],
						"type": "text/javascript"
					}
				}
			],
			"request": {
				"method": "PUT",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": "{\n    \"foo\": \"baz\",\n    \"qux\": \"qux\"\n}",
					"options": {
						"raw": {
							"language": "json"
						}
					}
				},
				"url": {
					"raw": "{{host}}/{{model}}/{{id}}",
					"host": [
						"{{host}}"
					],
					"path": [
						"{{model}}",
						"{{id}}"
					]
				}
			},
			"response": []
		},
		{
			"name": "DELETE delete {id}",
			"event": [
				{
					"listen": "test",
					"script": {
						"id": "5e7b6724-fef0-4a04-9250-c253b2ec6be0",
						"exec": [
							"pm.test(\"Status test\", function () {",
							"    pm.response.to.have.status(200);",
							"});"
						],
						"type": "text/javascript"
					}
				}
			],
			"request": {
				"method": "DELETE",
				"header": [],
				"url": {
					"raw": "{{host}}/{{model}}/{{id}}",
					"host": [
						"{{host}}"
					],
					"path": [
						"{{model}}",
						"{{id}}"
					]
				}
			},
			"response": []
		}
	],
	"protocolProfileBehavior": {}
}