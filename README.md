# FMS Export

An internal tool to export data for a particular council from the main
Fixmystreet database in CSV format.

## Setup

Copy the `.env.example` file to `.env` and fill in the correct connection details.

*Note:* If you're connecting the the live mySociety database, you might need
to connect to the VPN.

## Running

Install the dependencies:

```
bundle install
```

Run the task (setting the council ID as an ENV variable)

```
bundle exec rake export COUNCIL={council_id}
```

You can also set optional variables for category (`CATEGORY`), ward (`AREA`) and
state (`STATE`) to add additional filters.

The script outputs the CSV to the command line (for flexibility's sake), but you
can easily output this to a file with:

```
bundle exec rake export COUNCIL={council_id} > export.csv
```
