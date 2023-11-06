# dbt-fakerairbyte e-commerce shop

# Objective

To create trust in the data the business decisions are based upon.

This is done by building business insights in a fast, simple and reliable way.

# Quick overview

5 min video project overview -> XXXXXXXXX

The data is analysed and visualized in Looker Studio -> https://lookerstudio.google.com/s/kW1U2s_B0Js

The raw data is loaded into BigQuery and transformed using dbt.

Fake e-commerce data are used as source data.

Detailed dbt project documentation-> XXXXXXXX

# Architecture

The ability to iterate quickly and scale dynamically is invaluable for creating business value.

To meet this requirement, the modern data stack has been choosen as the architecture.

The main objective of the modern data stack is to use cloud-based, plug-and-play, easy-to-use, off-the-shelf components.

This creates a modular and cost-effective data architecture.

These components include data pipelines, storage, transformation, data management/governance, monitoring, visualization, and exploration.

# List of tools used

- Extract & Load: Airbyte
- Data Warehouse: BigQuery
- Transformation: dbt Cloud
- Testing: dbt Cloud
- Data Quality: dbt Cloud
- Documentation: dbt Cloud
- Version Control: GitHub
- CI/CD: none (GitHub Actions not used)
- Orchestration: none (dbt Cloud jobs)
- Data Catalog: none (dbt documentation is used)
- Operational Analytics: none
- Analytics & Visualization: Looker Studio
- Infrastructure: none - all tools are fully managed cloud versions

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

https://docs.getdbt.com/docs/cloud/about-cloud-setup

or

https://docs.getdbt.com/quickstarts

- setup dbt Project
- connecting to BigQuery
- connecting to GitHub
- create dbt project structure https://docs.getdbt.com/guides/best-practices/how-we-structure/1-guide-overview
- enabling CI https://docs.getdbt.com/guides/orchestration/set-up-ci/in-15-minutes

## Testing: dbt Cloud

In the models/intermediate and models/marts folder you will find the xxxx\_\_models.yml files. 

The standard dbt test where used, e.g. 'unique' and 'not null'

## Documentation: dbt Cloud

During the CI setup for production the flag 'generate docs on run' was set.

## Version Control: GitHub

How to connect GitHub to dbt - https://docs.getdbt.com/docs/cloud/git/connect-github

## Analytics & Visualization: Looker Studio

Option 1: In BigQuery, open your final marts table and use the the 'Export' -> 'Explore in Looker Studio' option
Option 2: open Looker Studio (https://lookerstudio.google.com/), 'create report' and press the 'Add Data' button to connect to your marts table in BigQuery
