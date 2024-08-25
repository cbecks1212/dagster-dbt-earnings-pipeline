from dagster import Definitions
from dagster_dbt import DbtCliResource
from .assets import earningsdbttwo_dbt_assets
from .project import earningsdbttwo_project
from .schedules import schedules

defs = Definitions(
    assets=[earningsdbttwo_dbt_assets],
    schedules=schedules,
    resources={
        "dbt": DbtCliResource(project_dir=earningsdbttwo_project),
    },
)