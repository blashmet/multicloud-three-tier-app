#Overview

This multicloud project provisions a 3-Tier application (load balancer, web app, and database) on prem (vSphere\NSX-T), as well as to the 3 major public cloud providers (AWS, Azure, and GCP)

An infrastructure as code command line tool ('runway') wraps the project.

The full documentation for runway may be found here (https://docs.onica.com/projects/runway/en/release/), but a brief getting started guide is provided below.

#Created By

Brandon Lashmet

#Directions on how to leverage the code

1. Install runway (https://docs.onica.com/projects/runway/en/release/installation.html)

2. Change working directory to $(cloud_provider)\$(service)\$(environment)

3. Set the CI environment variable to $null (e.g., on Windows, $env:CI=$null, or on Linux, export CI="").
CI may be set to any non-null value if you would like to remove prompts to implement in a CI\CD pipeline.

4. Execute "runway deploy" to be presented with a list of deployment options regulated by runway.yml in the environment directory root.


#Variables/Parameters

1. This project includes both CloudFormation and Terraform.

2. For CloudFormation modules, runway synthesizes 4 files to generate deployment options (e.g., region, IAM role to assume, etc.) and, lastly, a finalized CloudFormation template that uploads to an S3 bucket and executes using the CloudFormation service.

  The 4 files are as follows

    -runway.yml (contains the names of the modules to run along with numerous other config options, see full details here: https://docs.onica.com/projects/runway/en/release/runway_config.html#top-level-configuration)

    -stacks.yml (contains stacks to deploy and the path to the CloudFormation template to use to generate the stack. this file acts as an abstraction layer to define which parameters pass to the CloudFormation template. parameters can be passed directly from the env_vars.env file or from cross-stack (i.e., xref or rxref) lookups, syntax here: https://docs.onica.com/projects/runway/en/release/cfngin/lookups.html?highlight=xref )

    -env_vars.env (values for environment variables)

    -template.yml (parameterized CloudFormation template, which contains an outputs section. the outputs may be referenced in stacks.yml to pass values between stacks)

3. For Terraform modules, see here for directory structure and how to configure them (https://docs.onica.com/projects/runway/en/release/terraform/directory_structure.html)