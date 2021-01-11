# Serverless-Farms

This is an attempt at creating a dev platform/system for Fearless Farms to use to build solutions
quickly.  The goal is to create a library of templates that add narrow, but deep functionality to the app
as pure code that can then be used as a place to begin development.  The hope is to capture the benefitss
of generated code, while losing none of the flexibility.  This demo chose to use Python for the backend.
Long term many languages should be supported, even interchangeably on the same project if needed.

## Getting Started
### Requirements
1. Serverless - The [serverless framework](http://serverless.org) handles application lifecycle management
1. hygen - [Hygen](https://www.hygen.io/) is a code generator that uses templates to generate code
1. AWS account - All infrastructure is designed for use at AWS, you need to have a login.  For convenience
it would be helpful if you have a named profile called "fearless" in youw .aws/credentials file.
1. newman (optional) - is a command line test runner for Postman.  It is helpful for running integration 
tests on the command line and be extension in a CI/CD pipeline.   

### Quickstart ** Already outdated **
1. clone repo
1. ```cd solution```
1. ```hygen rest-api new <MODEL_NAME>``` - This will create the code necessary for a rest API for your
chosen model name.  This incluudes application code as well as serverless deployment code.
1. ```make deploy s=knoll``` - This will use serverless to deploy your application to AWS.  This command will
 display a series of similar URL's.  in the form of ```https://tkkzosz1f7.execute-api.us-east-1.amazonaws.com/dev/<MODEL_NAME>```
 Going forward all but the <MODEL_NAME> portion of this URL will be referred to as the API_URL.
1. test your deployment - One artifact that was created is a collection of postman tests that 
can be run on the command line via Newman or imported into Postman.  If you import them into postman
you will need to create an environment with a value for host that is set to the API_URL (no trailing slash)
and one for model that is set to MODEL_NAME.  To run it on the command line you can use 
```bash
newman run backend/postman/<model_name>.postman_collection.json --env-var "host=<API_URL>" --env-var model="<MODEL_NAME>"

``` 


You now have a working REST API for your model.  This can be extended or used as is.

To facilitate multiple deployments the repo uses a stage file located in settings/config to set
some variables.  You can easily make one for youself by running ```hygen settings nes <NAME>```.
Once you do that you can run ```make deploy s=<NAME>``` and deploy your own copy of the code.  This allows
for an infinite number of deployments without collisions (as long as each environment has a unique name).  
Furthermore, production, staging and even individual github users can all have their own version
of the deployed code.


## Next Steps
If this is helpful then the next step is to continue to build out the library of templates.  I think
the next most impactful piece would be to create a deployment for a front end.  This stack
would be sufficient for quite a complex app that could be created and deployed in an hour.