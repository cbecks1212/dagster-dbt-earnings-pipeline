# Use the official Python image
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Dagster application and dbt project into the container
COPY dbt_dagster_earnings /app/dbt_dagster_earnings
COPY earningsdbttwo /app/earningsdbttwo
COPY logs /app/logs

# Set environment variables
ENV PYTHONPATH="/app:${PYTHONPATH}"
ENV DAGSTER_HOME=/app/dbt_dagster_earnings
ENV DBT_PROFILES_DIR=/app/earningsdbttwo

# Expose the port that Dagster's webserver will run on
EXPOSE 8080

# Set the default command to start the Dagster webserver
ENTRYPOINT ["dagster-webserver", "-h", "0.0.0.0", "-p", "8080", "--module-name", "dbt_dagster_earnings.dbt_dagster_earnings.definitions", "--working-directory", "/app"]




# Optional: If you need a shell for debugging, you can override the entrypoint
# CMD ["/bin/bash"]
