# dbt-fakerairbyte e-commerce shop

# Objective
Create business insights in a fast and simple way, reliably, to create trust in the data the business decisions are based upon.

# Quick overview
Fake e-commerce data are used as source data. 
The raw data is loaded into BigQuery and transformed using dbt. 
The data is analyzed and visualized in Looker Studio.

# Architecture
The ability to iterate quickly and scale dynamically is invaluable for creating business value.
To meet this requirement, the modern data stack has been choosen as the architecture. 
The main objective of the modern data stack is to use cloud-based, plug-and-play, easy-to-use, off-the-shelf components to create a modular and cost-effective data architecture. 
These components include data pipelines, storage, transformation, data management/governance, monitoring, visualization, and exploration. 

# List of tools used
- Ingestion, Extract & Load: Airbyte
- Data Warehouse: BigQuery
- Data Transformation: dbt Cloud
- Testing: dbt Cloud
- Documentation: dbt Cloud
- Repository: GitHub
- Orchestration: Continous Integration (CI) is used in dbt Cloud
- Data Catalog: none
- Operational Analytics: none
- Analysis & Visualization: Looker Studio
- Infrastructure as Code (IaC): none

# Setup
## Ingestion, Extract & Load: Airbyte
Faker is a e-commerce dataset from Airbyte. It generates sample data using the python mimesis package.
There are three tables: products, purchses and users.
In Airbyte a connector (Sample Data (Faker) → BigQuery) was created using:
- source: 'Faker' (https://docs.airbyte.com/integrations/sources/faker) 
- destination: BigQuery. For the Airbyte data to load into BigQuery follow the guidelines fom Airbyte. 
on how to create a Google Cloud Project, a dataset and a service account.

## Data Warehouse: BigQuery
Follow the guidelines from Airbyte when setting up BigQuery as a destination.
Follow the guidelines from dbt when setting up connecting to BigQuery as a data warehouse, https://docs.getdbt.com/docs/cloud/connect-data-platform/connect-bigquery

## Data Transformation: dbt Cloud
https://docs.getdbt.com/docs/cloud/about-cloud-setup
or
https://docs.getdbt.com/quickstarts

- setup Project
- connecting to BigQuery
- connecting to GitHub 
- create dbt project structure https://docs.getdbt.com/guides/best-practices/how-we-structure/1-guide-overview
- enabling CI https://docs.getdbt.com/guides/orchestration/set-up-ci/in-15-minutes

## Testing: dbt Cloud
In the models/intermediate and models/marts folder you will find the xxxx__models.yml files. The standard dbt test where used, e.g. 'unique' and 'not null'

## Documentation: dbt Cloud
During the CI steup for production the flag 'generate docs on run' was set.

- Repository: GitHub
- Orchestration: Continous Integration (CI) is used in dbt Cloud
- Data Catalog: none
- Operational Analytics: none
- Analysis & Visualization: Looker Studio
- Infrastructure as Code (IaC): none