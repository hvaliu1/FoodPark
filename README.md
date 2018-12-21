# Food Park 

Project Description

The objective of this project will be to design, develop and deploy an API that is able to provide information on proper storage and handle of various food items. This API will be able to pull information from the publicly available FoodKeeper dataset found on www.data.gov, which has information on various foods but is in a format not consumable by outside applications. FoodKeeper application educates users about food and beverages storage to help them maximize the freshness and quality of these items. By helping users understand food storage, the application empowers consumers to choose storage methods that extend the shelf life of their items. By doing so users will be able to keep items fresh longer than if they were not stored properly. The API will be web based and will require API key, which will help prevent DOS/DDOS attacks, to access it. The API will follow JSON formatting. 

Prerequisites
 Install Apache Tomcat Server


Start Tomcat Server
Once you have installed Tomcat, you can start it using the below command:
cd F:\Tomcat\bin to change the directory to where Tomcat is installed. Run `catalina.bat run` to start tomcat or  start the tomcat as service.

Stop Tomcat Server
To stop the Tomcat Server Press ctrl+c to stop the tomcat . Or Stop the tomcat service. Once Tomcat is started, test it out by launching your browser and doing the following: Browse to http://localhost:8080/ tomcat home page will be displayed.

Install PostgreSQL
Download & Install PostgreSQL
To install PostgreSQL, download the installation file from here
After completion of successful installation, Create the database by running the below command in command prompt
createdb -h localhost -p 5432 -U postgress foodpark
and load the sql dump by doing following (Navigate to the Installation folder bin of Postgresql)
psql.exe -U postgres –D foodpark –f D:\ foodpark_dump.sql  
if it prompts for the password, enter your postgres password and hit enter, database will be loaded.
Now we are done with database setup.



This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 6.2.1.

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `--prod` flag for a production build.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI README](https://github.com/angular/angular-cli/blob/master/README.md).
