output "beanstalk_env_arn" {

  value = aws_elastic_beanstalk_environment.beanstalk_env.arn
  
}

output "beanstalk_endpoint_url" {

  value = aws_elastic_beanstalk_environment.beanstalk_env.endpoint_url
  
}