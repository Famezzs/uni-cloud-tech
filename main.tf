module "dynamo_db_courses" {
  source  = "./modules/dynamodb"
  context = module.default_labels.context
  name    = "courses"
}

module "dynamo_db_authors" {
  source  = "./modules/dynamodb"
  context = module.default_labels.context
  name    = "authors"
}