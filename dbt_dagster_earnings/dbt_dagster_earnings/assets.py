from dagster import AssetExecutionContext
from dagster_dbt import DbtCliResource, dbt_assets

from .project import earningsdbttwo_project


@dbt_assets(manifest=earningsdbttwo_project.manifest_path)
def earningsdbttwo_dbt_assets(context: AssetExecutionContext, dbt: DbtCliResource):
    yield from dbt.cli(["build"], context=context).stream()
    