from pathlib import Path

from dagster_dbt import DbtProject

earningsdbttwo_project = DbtProject(
    project_dir=Path(__file__).joinpath("..", "..", "..", "earningsdbttwo").resolve(),
    packaged_project_dir=Path(__file__).joinpath("..", "..", "dbt-project").resolve(),
)
earningsdbttwo_project.prepare_if_dev()