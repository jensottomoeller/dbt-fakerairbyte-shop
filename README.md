# dbt-fakerairbyte e-commerce shop

# Objective

To produce trustworthy (high-quality, consistent, secure, etc.) information that supports downstream use cases.

Eventually to create business value.

# Quick overview

3 min video project overview -> https://youtu.be/2NFM5Hr6Mis

The data is analysed and visualized in Looker Studio.

The data warehouse is Google BigQuery.

The raw data is loaded into BigQuery with Airbyte.

The data in BigQuery is transformed using dbt.

Fake e-commerce data from Airbyte is used as source data.

Detailed dbt project documentation

# Architecture

The ability to iterate quickly and scale dynamically is invaluable for creating business value.

To meet this requirement, the modern data stack has been choosen as the architecture,

meaning cloud-based, plug-and-play, easy-to-use, off-the-shelf, serverless and scalable components are used.

This creates a modular and cost-effective data architecture.

These components include data pipelines, storage, transformation, data management/governance, monitoring, visualization, and exploration.

Note: Nothing has been installed locally on a machine. Everything is cloud based.

# List of components used

- Extract & Load: Airbyte
- Data Warehouse: BigQuery
- Transformation: dbt Cloud
- Testing: dbt Cloud
- Data Quality: dbt Cloud
- Documentation: dbt Cloud
- Version Control: GitHub
- CI/CD: CI job setup in dbt (GitHub Actions not used)
- Orchestration: none (dbt Cloud jobs)
- Data Catalog: none (dbt documentation is used)
- Operational Analytics: none
- Analytics & Visualization: Looker Studio
- Infrastructure: none - all tools are fully managed cloud versions
- Observability: none

# Setup

## Extract & Load: Airbyte

Faker is a e-commerce dataset from Airbyte. It generates sample data using the python mimesis package.

There are three tables: products, purchases, users.

In Airbyte a connector (Sample Data (Faker) → BigQuery) was created using:

- source: 'Faker' (https://docs.airbyte.com/integrations/sources/faker)
- destination: BigQuery. For the Airbyte data to load into BigQuery follow the guidelines fom Airbyte.
  on how to create a Google Cloud Project, a dataset and a service account.

## Data Warehouse: BigQuery

Follow the guidelines from Airbyte when setting up BigQuery as a destination.

Follow the guidelines from dbt when setting up connecting to BigQuery as a data warehouse.

https://docs.getdbt.com/docs/cloud/connect-data-platform/connect-bigquery

## Transformation: dbt Cloud

https://docs.getdbt.com/quickstarts    and  
https://docs.getdbt.com/docs/cloud/about-cloud-setup

- setup dbt Project
- connecting to BigQuery
- connecting to GitHub
- create dbt project structure https://docs.getdbt.com/guides/best-practices/how-we-structure/1-guide-overview
- enabling CI https://docs.getdbt.com/guides/orchestration/set-up-ci/in-15-minutes

## Testing: dbt Cloud

In the models/intermediate and models/marts folder you will find the xxxx\_\_models.yml files. 

The following generic dbt test where used, 'unique', 'not null' and relationships.

## Documentation: dbt Cloud

During the CI setup for production the flag 'generate docs on run' was set.

## Version Control: GitHub

How to connect GitHub to dbt - https://docs.getdbt.com/docs/cloud/git/connect-github

## Analytics & Visualization: Looker Studio

Go to Looker Studio (https://lookerstudio.google.com/), 'create report' and press the 'Add Data' button to connect to your marts table in BigQuery

(alternatively, in BigQuery, open your final marts table and use the the 'Export' -> 'Explore in Looker Studio' option)