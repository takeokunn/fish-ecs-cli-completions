# subcommands
complete -f -c ecs-cli -n '__fish_use_subcommand' -xa configure -d "Stores a single cluster configuration."
complete -f -c ecs-cli -n '__fish_use_subcommand' -xa up -d "Creates the ECS cluster (if it does not already exist) and the AWS resources required to set up the cluster."
complete -f -c ecs-cli -n '__fish_use_subcommand' -xa down -d "Deletes the CloudFormation stack that was created by ecs-cli up and the associated resources."
complete -f -c ecs-cli -n '__fish_use_subcommand' -xa scale -d "Modifies the number of container instances in your cluster. This command changes the desired and maximum instance count in the Auto Scaling group created by the ecs-cli up command. You can use this command to scale up (increase the number of instances) or scale down (decrease the number of instances) your cluster."
complete -f -c ecs-cli -n '__fish_use_subcommand' -xa ps -d "Lists all of the running containers in your ECS cluster."
complete -f -c ecs-cli -n '__fish_use_subcommand' -xa push -d "Pushes an image to an Amazon ECR repository."
complete -f -c ecs-cli -n '__fish_use_subcommand' -xa pull -d "Pulls an image from an Amazon ECR repository."
complete -f -c ecs-cli -n '__fish_use_subcommand' -xa images -d "Lists images from an Amazon ECR repository. Lists all images in all repositories by default."
complete -f -c ecs-cli -n '__fish_use_subcommand' -xa license -d "Prints the LICENSE files for the ECS CLI and its dependencies."
complete -f -c ecs-cli -n '__fish_use_subcommand' -xa compose -d "Executes docker-compose-style commands on an ECS cluster."
complete -f -c ecs-cli -n '__fish_use_subcommand' -xa check-attributes -d "Checks if a given list of container instances can run a given task definition by checking their attributes. Outputs attributes that are required by the task definition but not present on the container instances."
complete -f -c ecs-cli -n '__fish_use_subcommand' -xa logs -d "Retrieves container logs from CloudWatch logs. Assumes your Task Definition uses the awslogs driver and has a log stream prefix specified."
complete -f -c ecs-cli -n '__fish_use_subcommand' -xa registry-creds -d "Facilitates the creation and use of private registry credentials within ECS."
complete -f -c ecs-cli -n '__fish_use_subcommand' -xa local -d "Runs your ECS tasks locally."
complete -f -c ecs-cli -n '__fish_use_subcommand' -xa help -d "Shows a list of commands or help for one command"

# global options
complete -c ecs-cli -l endpoint -d "Use a custom endpoint with the ECS CLI"
complete -c ecs-cli -l help -s h -d "show help"
complete -c ecs-cli -l version -s v -d "print the version"

# configure subcommands/options
complete -c ecs-cli -n '__fish_seen_subcommand_from configure' -xa profile -d "Stores a single profile."
complete -c ecs-cli -n '__fish_seen_subcommand_from configure' -xa default -d "Sets the default cluster config."
complete -c ecs-cli -n '__fish_seen_subcommand_from configure' -xa migrate -d "Migrates a legacy ECS CLI configuration file to the current YAML format."
complete -c ecs-cli -n '__fish_seen_subcommand_from configure' -l cluster -s c -d "Specifies the ECS cluster name to use. If the cluster does not exist, it is created when you try to add resources to it with the ecs-cli up command. [$ECS_CLUSTER]"
complete -c ecs-cli -n '__fish_seen_subcommand_from configure' -l region -s r -d "Specifies the AWS region to use. If the AWS_REGION environment variable is set when ecs-cli configure is run, then the AWS region is set to the value of that environment variable. [$AWS_REGION]"
complete -c ecs-cli -n '__fish_seen_subcommand_from configure' -l config-name -d "Specifies the cluster configuration name to use for this configuration. (default: \"default\")"
complete -c ecs-cli -n '__fish_seen_subcommand_from configure' -l cfn-stack-name -d "[Optional] Specifies the name of AWS CloudFormation stack created on ecs-cli up. (default: \"amazon-ecs-cli-setup-<cluster-name>\")"

# up subcommands/options
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l capability-iam -d "Acknowledges that this command may create IAM resources. Required if --instance-role is not specified. NOTE: Not applicable for launch type FARGATE or when creating an empty cluster."
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l empty -s e -d "[Optional] Specifies that an ECS cluster will be created with no resources."
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l instance-role -d "[Optional] Specifies a custom IAM Role for instances in your cluster. A new instance profile will be created and attached to this role. Required if --capability-iam is not specified. NOTE: Not applicable for launch type FARGATE."
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l keypair -d "[Optional] Specifies the name of an existing Amazon EC2 key pair to enable SSH access to the EC2 instances in your cluster. Recommended for EC2 launch type. NOTE: Not applicable for launch type FARGATE."
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l instance-type -d "[Optional] Specifies the EC2 instance type for your container instances. If you specify the A1 instance family, the ECS optimized arm64 AMI will be used, otherwise the x86 AMI will be used. Defaults to t2.micro. NOTE: Not applicable for launch type FARGATE."
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l spot-price -d "[Optional] If filled and greater than 0, EC2 Spot instances will be requested."
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l image-id -d "[Optional] Specify the AMI ID for your container instances. Defaults to amazon-ecs-optimized AMI. NOTE: Not applicable for launch type FARGATE."
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l no-associate-public-ip-address -d "[Optional] Do not assign public IP addresses to new instances in this VPC. Unless this option is specified, new instances in this VPC receive an automatically assigned public IP address. NOTE: Not applicable for launch type FARGATE."
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l size -d "[Optional] Specifies the number of instances to launch and register to the cluster. Defaults to 1. NOTE: Not applicable for launch type FARGATE."
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l azs -d "[Optional] Specifies a comma-separated list of 2 VPC Availability Zones in which to create subnets (these zones must have the available status). This option is recommended if you do not specify a VPC ID with the --vpc option. WARNING: Leaving this option blank can result in failure to launch container instances if an unavailable zone is chosen at random."
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l security-group -d "[Optional] Specifies a comma-separated list of existing security groups to associate with your container instances. If you do not specify a security group here, then a new one is created."
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l cidr -d "[Optional] Specifies a CIDR/IP range for the security group to use for container instances in your cluster. This parameter is ignored if an existing security group is specified with the --security-group option. Defaults to 0.0.0.0/0."
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l port -d "[Optional] Specifies a port to open on the security group to use for container instances in your cluster. This parameter is ignored if an existing security group is specified with the --security-group option. Defaults to port 80."
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l subnets -d "[Optional] Specifies a comma-separated list of existing VPC Subnet IDs in which to launch your container instances. This option is required if you specify a VPC with the --vpc option."
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l vpc -d "[Optional] Specifies the ID of an existing VPC in which to launch your container instances. If you specify a VPC ID, you must specify a list of existing subnets in that VPC with the --subnets option. If you do not specify a VPC ID, a new VPC is created with two subnets."
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l extra-user-data -d "[Optional] Specifies additional User Data for your EC2 instances. Files can be shell scripts or cloud-init directives and are packaged into a MIME Multipart Archive along with ECS CLI provided User Data which directs instances to join your cluster."
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l force -s f -d "[Optional] Forces the recreation of any existing resources that match your current configuration. This option is useful for cleaning up stale resources from previous failed attempts."
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l tags -d "[Optional] Specify tags which will be added to AWS Resources created for your cluster. Specify in the format 'key1=value1,key2=value2,key3=value3'"
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l region -s r -d "[Optional] Specifies the AWS region to use. Defaults to the region configured using the configure command"
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l ecs-profile -d "[Optional] Specifies the name of the ECS profile configuration to use. Defaults to the default profile configuration. [$ECS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l aws-profile -d "[Optional] Use the AWS credentials from an existing named profile in ~/.aws/credentials. [$AWS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l cluster-config -d "[Optional] Specifies the name of the ECS cluster configuration to use. Defaults to the default cluster configuration."
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l cluster -s c -d "[Optional] Specifies the ECS cluster name to use. Defaults to the cluster configured using the configure command"
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l launch-type -d "[Optional] Specifies the launch type. Options: EC2 or FARGATE. Overrides the default launch type stored in your cluster configuration. Defaults to EC2 if a cluster configuration is not used."
complete -c ecs-cli -n '__fish_seen_subcommand_from up' -l debug -l verbose -d "[Optional] Increase the verbosity of command output to aid in diagnostics."

# down subcommands/options
complete -c ecs-cli -n '__fish_seen_subcommand_from down' -l force -s f -d "[Optional] Acknowledges that this command permanently deletes resources."
complete -c ecs-cli -n '__fish_seen_subcommand_from down' -l region -s r -d "[Optional] Specifies the AWS region to use. Defaults to the region configured using the configure command"
complete -c ecs-cli -n '__fish_seen_subcommand_from down' -l ecs-profile -d "[Optional] Specifies the name of the ECS profile configuration to use. Defaults to the default profile configuration. [$ECS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from down' -l aws-profile -d "[Optional] Use the AWS credentials from an existing named profile in ~/.aws/credentials. [$AWS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from down' -l cluster-config -d "[Optional] Specifies the name of the ECS cluster configuration to use. Defaults to the default cluster configuration."
complete -c ecs-cli -n '__fish_seen_subcommand_from down' -l cluster -d "[Optional] Specifies the ECS cluster name to use. Defaults to the cluster configured using the configure command"

# scale subcommands/options
complete -c ecs-cli -n '__fish_seen_subcommand_from scale' -l capability-iam -d "Acknowledges that this command may create IAM resources."
complete -c ecs-cli -n '__fish_seen_subcommand_from scale' -l size -d "Specifies the number of instances to maintain in your cluster."
complete -c ecs-cli -n '__fish_seen_subcommand_from scale' -l region -s r -d "[Optional] Specifies the AWS region to use. Defaults to the region configured using the configure command"
complete -c ecs-cli -n '__fish_seen_subcommand_from scale' -l ecs-profile -d "[Optional] Specifies the name of the ECS profile configuration to use. Defaults to the default profile configuration. [$ECS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from scale' -l aws-profile -d "[Optional] Use the AWS credentials from an existing named profile in ~/.aws/credentials. [$AWS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from scale' -l cluster-config -d "[Optional] Specifies the name of the ECS cluster configuration to use. Defaults to the default cluster configuration."
complete -c ecs-cli -n '__fish_seen_subcommand_from scale' -l cluster -d "[Optional] Specifies the ECS cluster name to use. Defaults to the cluster configured using the configure command"

# ps subcommands/options
complete -c ecs-cli -n '__fish_seen_subcommand_from ps' -l region -d "[Optional] Specifies the AWS region to use. Defaults to the region configured using the configure command"
complete -c ecs-cli -n '__fish_seen_subcommand_from ps' -l ecs-profile -d "[Optional] Specifies the name of the ECS profile configuration to use. Defaults to the default profile configuration. [$ECS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from ps' -l aws-profile -d "[Optional] Use the AWS credentials from an existing named profile in ~/.aws/credentials. [$AWS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from ps' -l cluster-config -d "[Optional] Specifies the name of the ECS cluster configuration to use. Defaults to the default cluster configuration."
complete -c ecs-cli -n '__fish_seen_subcommand_from ps' -l cluster -d "[Optional] Specifies the ECS cluster name to use. Defaults to the cluster configured using the configure command"
complete -c ecs-cli -n '__fish_seen_subcommand_from ps' -l desired-status -d "[Optional] Filter tasks by desired status. Valid values: RUNNING or STOPPED"

# push subcommands/options
complete -c ecs-cli -n '__fish_seen_subcommand_from push' -l register-id -d "[Optional] Specifies the Amazon ECR registry ID to push the image to. By default, images are pushed to the current AWS account."
complete -c ecs-cli -n '__fish_seen_subcommand_from push' -l tags -d "[Optional] Specify AWS Resource tags which will be to your ECR repository. Specify in the format 'key1=value1,key2=value2,key3=value3."
complete -c ecs-cli -n '__fish_seen_subcommand_from push' -l region -s r -d "[Optional] Specifies the AWS region to use. Defaults to the region configured using the configure command"
complete -c ecs-cli -n '__fish_seen_subcommand_from push' -l ecs-profile -d "[Optional] Specifies the name of the ECS profile configuration to use. Defaults to the default profile configuration. [$ECS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from push' -l aws-profile -d "[Optional] Use the AWS credentials from an existing named profile in ~/.aws/credentials. [$AWS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from push' -l cluster-config -d "[Optional] Specifies the name of the ECS cluster configuration to use. Defaults to the default cluster configuration."
complete -c ecs-cli -n '__fish_seen_subcommand_from push' -l debug -l verbose -d "[Optional] Increase the verbosity of command output to aid in diagnostics."
complete -c ecs-cli -n '__fish_seen_subcommand_from push' -l use-fips -l fips -d "[Optional] Routes calls to ECR through FIPS endpoints."

# pull subcommands/options
complete -c ecs-cli -n '__fish_seen_subcommand_from pull' -l registry-id -d "[Optional] Specifies the the Amazon ECR registry ID to pull the image from. By default, images are pulled from the current AWS account."
complete -c ecs-cli -n '__fish_seen_subcommand_from pull' -l region -s r -d "[Optional] Specifies the AWS region to use. Defaults to the region configured using the configure command"
complete -c ecs-cli -n '__fish_seen_subcommand_from pull' -l ecs-profile -d "[Optional] Specifies the name of the ECS profile configuration to use. Defaults to the default profile configuration. [$ECS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from pull' -l aws-profile -d "[Optional] Use the AWS credentials from an existing named profile in ~/.aws/credentials. [$AWS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from pull' -l cluster-config -d "[Optional] Specifies the name of the ECS cluster configuration to use. Defaults to the default cluster configuration."
complete -c ecs-cli -n '__fish_seen_subcommand_from pull' -l verbose -l debug -d "[Optional] Increase the verbosity of command output to aid in diagnostics."
complete -c ecs-cli -n '__fish_seen_subcommand_from pull' -l use-fips -l fips -d "[Optional] Routes calls to ECR through FIPS endpoints."

# images subcommands/options
complete -c ecs-cli -n '__fish_seen_subcommand_from images' -l tagged -d "[Optional] Filters the result to show only tagged images"
complete -c ecs-cli -n '__fish_seen_subcommand_from images' -l untagged -d "[Optional] Filters the result to show only untagged images"
complete -c ecs-cli -n '__fish_seen_subcommand_from images' -l region -s r -d "[Optional] Specifies the AWS region to use. Defaults to the region configured using the configure command"
complete -c ecs-cli -n '__fish_seen_subcommand_from images' -l ecs-profile -d "[Optional] Specifies the name of the ECS profile configuration to use. Defaults to the default profile configuration. [$ECS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from images' -l aws-profile -d "[Optional] Use the AWS credentials from an existing named profile in ~/.aws/credentials. [$AWS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from images' -l cluster-config -d "[Optional] Specifies the name of the ECS cluster configuration to use. Defaults to the default cluster configuration."
complete -c ecs-cli -n '__fish_seen_subcommand_from images' -l verbose -l debug -d "[Optional] Increase the verbosity of command output to aid in diagnostics."

# compose subcommands/options
complete -c ecs-cli -n '__fish_seen_subcommand_from compose' -xa create -d "Creates an ECS task definition from your compose file. Note that we do not recommend using plain text environment variables for sensitive information, such as credential data."
complete -c ecs-cli -n '__fish_seen_subcommand_from compose' -xa ps -d "Lists all the containers in your cluster that were started by the compose project."
complete -c ecs-cli -n '__fish_seen_subcommand_from compose' -xa run -d "Starts all containers overriding commands with the supplied one-off commands for the containers."
complete -c ecs-cli -n '__fish_seen_subcommand_from compose' -xa scale -d "Scales the number of running tasks to the specified count."
complete -c ecs-cli -n '__fish_seen_subcommand_from compose' -xa start -d "Starts a single task from the task definition created from your compose file."
complete -c ecs-cli -n '__fish_seen_subcommand_from compose' -xa stop -d "Stops all the running tasks created by the compose project."
complete -c ecs-cli -n '__fish_seen_subcommand_from compose' -xa up -d "Creates an ECS task definition from your compose file (if it does not already exist) and runs one instance of that task on your cluster (a combination of create and start)."
complete -c ecs-cli -n '__fish_seen_subcommand_from compose' -xa service -d "Manage Amazon ECS services with docker-compose-style commands on an ECS cluster."

complete -c ecs-cli -n '__fish_seen_subcommand_from compose' -l file -s f -d "Specifies one or more Docker compose files to use. Defaults to docker-compose.yml file, and an optional docker-compose.override.yml file. [$COMPOSE_FILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from compose' -l project-name -s p -d "Specifies the project name to use. Defaults to the current directory name. [$COMPOSE_PROJECT_NAME]"
complete -c ecs-cli -n '__fish_seen_subcommand_from compose' -l task-role-arn -d "[Optional] Specifies the short name or full Amazon Resource Name (ARN) of the IAM role that containers in this task can assume. All containers in this task are granted the permissions that are specified in this role."
complete -c ecs-cli -n '__fish_seen_subcommand_from compose' -l ecs-params -d "[Optional] Specifies ecs-params file to use. Defaults to ecs-params.yml file, if one exists."
complete -c ecs-cli -n '__fish_seen_subcommand_from compose' -l registry-creds -d "[Optional] Specifies the ecs-registry-creds file to use. Defaults to latest 'ecs-registry-creds' output file, if one exists."
complete -c ecs-cli -n '__fish_seen_subcommand_from compose' -l verbose -l debug -d "[Optional] Increase the verbosity of command output to aid in diagnostics."
complete -c ecs-cli -n '__fish_seen_subcommand_from compose' -l region -d "[Optional] Specifies the AWS region to use. Defaults to the region configured using the configure command"
complete -c ecs-cli -n '__fish_seen_subcommand_from compose' -l ecs-profile -d "[Optional] Specifies the name of the ECS profile configuration to use. Defaults to the default profile configuration. [$ECS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from compose' -l aws-profile -d "[Optional] Use the AWS credentials from an existing named profile in ~/.aws/credentials. [$AWS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from compose' -l cluster-config -d "[Optional] Specifies the name of the ECS cluster configuration to use. Defaults to the default cluster configuration."
complete -c ecs-cli -n '__fish_seen_subcommand_from compose' -l cluster -d "[Optional] Specifies the ECS cluster name to use. Defaults to the cluster configured using the configure command"

# check-attributes subcommands/options
complete -c ecs-cli -n '__fish_seen_subcommand_from check-attributes' -l region -s r -d "[Optional] Specifies the AWS region to use. Defaults to the region configured using the configure command"
complete -c ecs-cli -n '__fish_seen_subcommand_from check-attributes' -l ecs-profile -d "[Optional] Specifies the name of the ECS profile configuration to use. Defaults to the default profile configuration. [$ECS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from check-attributes' -l aws-profile -d "[Optional] Use the AWS credentials from an existing named profile in ~/.aws/credentials. [$AWS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from check-attributes' -l cluster-config -d "[Optional] Specifies the name of the ECS cluster configuration to use. Defaults to the default cluster configuration."
complete -c ecs-cli -n '__fish_seen_subcommand_from check-attributes' -l cluster -d "[Optional] Specifies the ECS cluster name to use. Defaults to the cluster configured using the configure command"
complete -c ecs-cli -n '__fish_seen_subcommand_from check-attributes' -l task-def -d "Specifies the name or full Amazon Resource Name (ARN) of the ECS Task Definition. This is required to gather attributes of a Task Definition."
complete -c ecs-cli -n '__fish_seen_subcommand_from check-attributes' -l container-instances -d "A list of container instance IDs or full ARN entries to check if all required attributes are available for the Task Definition to RunTask."

# logs subcommands/options
complete -c ecs-cli -n '__fish_seen_subcommand_from logs' -l region -s r -d "[Optional] Specifies the AWS region to use. Defaults to the region configured using the configure command"
complete -c ecs-cli -n '__fish_seen_subcommand_from logs' -l ecs-profile -d "[Optional] Specifies the name of the ECS profile configuration to use. Defaults to the default profile configuration. [$ECS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from logs' -l aws-profile -d "[Optional] Use the AWS credentials from an existing named profile in ~/.aws/credentials. [$AWS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from logs' -l cluster-config -d "[Optional] Specifies the name of the ECS cluster configuration to use. Defaults to the default cluster configuration."
complete -c ecs-cli -n '__fish_seen_subcommand_from logs' -l cluster -s c -d "[Optional] Specifies the ECS cluster name to use. Defaults to the cluster configured using the configure command"
complete -c ecs-cli -n '__fish_seen_subcommand_from logs' -l task-id -d "Print the logs for this ECS Task."
complete -c ecs-cli -n '__fish_seen_subcommand_from logs' -l task-def -d "[Optional] Specifies the name or full Amazon Resource Name (ARN) of the ECS Task Definition associated with the Task ID. This is only needed if the Task is using an inactive Task Definition."
complete -c ecs-cli -n '__fish_seen_subcommand_from logs' -l follow -d "[Optional] Specifies if the logs should be streamed."
complete -c ecs-cli -n '__fish_seen_subcommand_from logs' -l filter-pattern -d "[Optional] Substring to search for within the logs."
complete -c ecs-cli -n '__fish_seen_subcommand_from logs' -l container-name -d "[Optional] Prints the logs for the given container. Required if containers in the Task use different log groups"
complete -c ecs-cli -n '__fish_seen_subcommand_from logs' -l since -d "[Optional] Returns logs newer than a relative duration in minutes. Can not be used with --start-time (default: 0)"
complete -c ecs-cli -n '__fish_seen_subcommand_from logs' -l start-time -d "[Optional] Returns logs after a specific date (format: RFC 3339. Example: 2006-01-02T15:04:05+07:00). Cannot be used with --since flag"
complete -c ecs-cli -n '__fish_seen_subcommand_from logs' -l end-time -d "[Optional] Returns logs before a specific date (format: RFC 3339. Example: 2006-01-02T15:04:05+07:00). Cannot be used with --follow"
complete -c ecs-cli -n '__fish_seen_subcommand_from logs' -l timestamps -s t -d "[Optional] Shows timestamps on each line in the log output."

# registry-creds subcommands/options
complete -c ecs-cli -n '__fish_seen_subcommand_from registry-creds' -xa up -d "Uses a YAML input file to generate AWS Secrets Manager secrets and an IAM Task Execution Role for use in an ECS Task Definition."
complete -c ecs-cli -n '__fish_seen_subcommand_from registry-creds' -l region -s r -d "[Optional] Specifies the AWS region to use. Defaults to the region configured using the configure command"
complete -c ecs-cli -n '__fish_seen_subcommand_from registry-creds' -l ecs-profile -d "[Optional] Specifies the name of the ECS profile configuration to use. Defaults to the default profile configuration. [$ECS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from registry-creds' -l aws-profile -d "[Optional] Use the AWS credentials from an existing named profile in ~/.aws/credentials. [$AWS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from registry-creds' -l cluster-config -d "[Optional] Specifies the name of the ECS cluster configuration to use. Defaults to the default cluster configuration."

# local subcommands
complete -c ecs-cli -n '__fish_seen_subcommand_from local' -xa create -d "Creates a Compose file from an ECS task definition."
complete -c ecs-cli -n '__fish_seen_subcommand_from local' -xa up -d "Runs containers locally from an ECS Task Definition. NOTE: Creates a docker-compose file in current directory and a ecs-local-network if one doesn't exist."
complete -c ecs-cli -n '__fish_seen_subcommand_from local' -xa down -d "Stops and removes a running ECS task. NOTE: Removes the ecs-local-network if it has no more running tasks."
complete -c ecs-cli -n '__fish_seen_subcommand_from local' -xa ps -d "Lists locally running ECS task containers."
complete -c ecs-cli -n '__fish_seen_subcommand_from local' -l ecs-profile -d "[Optional] Specifies the name of the ECS profile configuration to use. Defaults to the default profile configuration. [$ECS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from local' -l aws-profile -d "[Optional] Use the AWS credentials from an existing named profile in ~/.aws/credentials. [$AWS_PROFILE]"
complete -c ecs-cli -n '__fish_seen_subcommand_from local' -l region -s r -d "[Optional] Specifies the AWS region to use. Defaults to the region configured using the configure command"
