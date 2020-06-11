Airplane API Docs

##### Link: https://dashboard.heroku.com/apps/whispering-dawn-24200 
##### Prepared by: Fudayl Talha Altinel
---
# Airplanes
---
## GET: url/airplanes
#### Gets the list of all airplanes that is available in the company.
---
## POST: url/airplanes
#### Adds a single or list of airplanes. Name and flying hours of airplane are required parameters. Id, created_at or updated_at are not required, it will generate when record is sent.
```javascript
{
	"name":"LAVOCHKIN LA-9",
	"flying_hours": 2,
}
```
---
## GET: url/airplanes/:id
#### Gets a single airplane’s information by its Id.Required parameter is ID in URL.
```javascript
{
	"id": 4,
	"name":"LAVOCHKIN LA-9",
	“flying_hours":14,
	"created_at":"2019-03-25T14:19:48.938Z",
	"updated_at": "2019-03-25T14:19:48.938Z"
}
```
---
## DELETE: url/airplanes/:id
#### Deletes a single airplane’s information by its Id. Required parameter is ID in URL.
---
## PUT: url/airplanes/:id
#### Updates a single airplane’s whole information. To get the better performance use it if you want to change the whole data of the airplane. However you can change a single data of a single airplane too. Required parameter is ID in URL.
---
## PATCH: url/airplanes/:id
#### Updates a single airplane’s partial information by its Id. To get better performance use it if you want to change the some data of the airplane. However you can change the whole data of a single airplane too. Required parameter is ID in URL.
---
# Humen(Engineers)
---
## GET: url/airplanes/:airplane_id/humen
#### Gets the list of engineers that are currently working for that airplane.
---
## POST: url/airplanes/:airplane_id/humen/
#### Adds a single or list of engineers. Name and job of the engineer are required parameters. ID, airplane_id, created_at or updated_at are not required, it will generate it when record is sent.
```javascript
{
	"name":"Boris Ivanov",
	"job": “Aerospace Engineer”
}
```
---
## GET: url/airplanes/:airplane_id/humen/:id
#### Gets a single engineer’s information by its Id.Required parameters are ID of the airplane and ID of the engineer in URL.
```javascript 
{
	"id": 1,
	"name":"Boris Ivanov",
	“job":”Aerospace Engineer”,
	“airplane_id":4,
	"created_at":"2019-03-25T14:19:48.938Z",
	"updated_at": "2019-03-25T14:19:48.938Z"
}
```
---
## DELETE: url/airplanes/:airplane_id/humen/:id
#### Deletes a single engineer’s information by its Id.Required parameters are ID of the airplane and ID of the engineer in URL.
---
## PUT: url/airplanes/:airplane_id/humen/:id
#### Updates a single engineer’s whole information by its Id. To get the better performance use it if you want to change the whole data of the engineer. However you can change a single data of a single engineer too. Required parameter is ID in URL.
---
## DELETE: url/airplanes/:airplane_id/humen/:id
#### Updates a single engineer’s partial information by its Id. To get better performance use it if you want to change the some data of the engineer. However you can change the whole data of a single engineer too. Required parameter is ID in URL.

