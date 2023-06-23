<h1 align="center">dbt Fundamentals</h1>
<h3 align="center">Getting started with Data Build Tool (dbt)</h3>

<br>

### Install dbt core
```bash
pip install dbt-core dbt-bigquery
```
<br>

### Start a dbt project
```bash
dbt init dbt_fundamentals
```
<br>

### Choose the following options
```
Which database would you like to use?
[1] bigquery
Enter a number: <type 1 for the database you want to use>

[1] oauth
[2] service_account
Desired authentication method option (enter a number): <type 1 or 2 for the desired auth method>
# if you chose 2, you have to create a keyfile to in GCP to be used in the next step

keyfile (/path/to/bigquery/keyfile.json): /Users/<your-user>/dbt_fundamentals/<project-id>-<12-char-hash>.json <insert the path to you keyfile>

project (GCP project id): <your GCP project id>

dataset (the name of your dbt dataset): <your bigquery dataset>

threads (1 or more): 1 <chose default threads: 1>

job_execution_timeout_seconds [300]: 300 <chose default timeout: 300>

[1] US
[2] EU
Desired location option (enter a number): <type 1 or 2 for the desired location>

Profile dbt_fundamentals written to /Users/<your-user>/.dbt/profiles.yml using target's profile_template.yml and your supplied values. Run 'dbt debug' to validate the connection.

Your new dbt project "dbt_fundamentals" was created!
```
<br>

## Run unique model
`dbt run --select model_name.sql`

<br>

## Run multiple models in a given folder
`dbt run --models your_folder_name`

<br>

## Create documentation
1. Add description to models
2. To create all .json files needed under `target` folder run:
```bash
dbt docs generate
```
3. Then run, this will act as server running in your terminal and lead you to your browser:
```bash
dbt docs serve
```

<br>

## Sources
If in the `.yml` the `schema` is not specifiec the `name` will be used as an alias for the `schema`

<br>

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
