# Screen Printing Tracker.

## Project Vision

Assist screen printers to track the progress of jobs.

## Feature 1

### Sales Preson: Create Job.

As a ***Sales Person*** I would like to create a new project so I can upload a proposed designs to the system.

#### Model: Project

| Attributes | Data_type | Conditons | 
| :--- | :--- | :--- |
| Name | string | not_null |
| Note | text | |
| Due_date | date | |
| Customer_name | string | not_null |

Project ***has_many*** designs.

### Model: Project_designs

Project_design ***belongs_to*** a Project

| Attribute | Data_type | Conditions |
| :--- | :--- | :--- |
| Name | string | not_null |
| Note | text | |
| Project_id | number |

#### Controller: Projects

CRUD.

##### Projects#index

- List all projects.
- Filter projects according to the text input.

#### Projects#show

- Show a project
#### Projects#new

- Response with Project object

### Project#create

- Strong Params
- name and customer_name not null
- name no duplication
