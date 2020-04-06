output "beanstalk_app_arn" {

  value = aws_elastic_beanstalk_application.beanstalk_app.arn
  
}

output "beanstalk_app_name" {

  value = aws_elastic_beanstalk_application.beanstalk_app.id
  
}