resource "google_cloudfunctions_function" "function" {
  project                       = var.project_id
  region                        = var.region
  name                          = var.function_name
  runtime                       = var.function_runtime
  vpc_connector                 = var.vpc_connector
  vpc_connector_egress_settings = "PRIVATE_RANGES_ONLY"

  # Get the source code of the cloud function as a Zip compression
  source_archive_bucket = var.archive_bucket
  source_archive_object = var.archive_object

  # Must match the function name in the cloud function `main.py` source code
  entry_point  = var.entry_point
  trigger_http = true

}

