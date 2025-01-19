provider "aws" {
  region = "us-east-2"
}

module "function" {
  source = "git@github.com:thzb134/devops-base.git//td3/tofu/modules/lambda"

  name = "lambda-sample"         
  src_dir = "${path.module}/src" 
  runtime = "python3.9"
  handler = "index.handler"
      

  memory_size = 128              
  timeout     = 5                

  environment_variables = {      
    NODE_ENV = "production"
  }

}

module "gateway" {
  source = "git@github.com:thzb134/devops-base.git//td3/tofu/modules/api-gateway"
    name = "lambda-sample"
    function_arn = module.function.function_arn
    api_gateway_routes = ["GET /", "POST /data"]
}
