# Terraform module to create a Watchmaker Windows Autoscaling Group using a CloudFormation cfn.json
# Assumes that watchmaker-win-autoscale.cfn.json is stored in the same directory as main.tf of the module.

resource "aws_cloudformation_stack" "watchmaker-win-autoscale" {
  template_body = "${file("${path.module}/watchmaker-win-autoscale.template.cfn.yaml")}"

  name               = "${var.Name}"
  capabilities       = "${var.Capabilities}"
  disable_rollback   = "${var.DisableRollback}"
  iam_role_arn       = "${var.IamRoleArn}"
  notification_arns  = "${var.NotificationArns}"
  on_failure         = "${var.OnFailureAction}"
  policy_body        = "${var.PolicyBody}"
  policy_url         = "${var.PolicyUrl}"
  tags               = "${var.StackTags}"
  timeout_in_minutes = "${var.TimeoutInMinutes}"

  parameters {
    AmiId                  = "${var.AmiId}"
    AppScriptParams        = "${var.AppScriptParams}"
    AppScriptUrl           = "${var.AppScriptUrl}"
    AppVolumeDevice        = "${var.AppVolumeDevice}"
    AppVolumeType          = "${var.AppVolumeType}"
    AppVolumeSize          = "${var.AppVolumeSize}"
    CloudWatchAgentUrl     = "${var.CloudWatchAgentUrl}"
    CloudWatchAppLogs      = "${join(",", var.CloudWatchAppLogs)}"
    KeyPairName            = "${var.KeyPairName}"
    InstanceType           = "${var.InstanceType}"
    InstanceRole           = "${var.InstanceRole}"
    MinCapacity            = "${var.MinCapacity}"
    MaxCapacity            = "${var.MaxCapacity}"
    DesiredCapacity        = "${var.DesiredCapacity}"
    ScaleDownSchedule      = "${var.ScaleDownSchedule}"
    ScaleUpSchedule        = "${var.ScaleUpSchedule}"
    NoPublicIp             = "${var.NoPublicIp}"
    NoReboot               = "${var.NoReboot}"
    PatchGroup             = "${var.PatchGroup}"
    SecurityGroupIds       = "${var.SecurityGroupIds}"
    SubnetIds              = "${var.SubnetIds}"
    TargetGroupArns        = "${var.TargetGroupArns}"
    LoadBalancerNames      = "${var.LoadBalancerNames}"
    PypiIndexUrl           = "${var.PypiIndexUrl}"
    PythonInstaller        = "${var.PythonInstaller}"
    WatchmakerBootstrapper = "${var.WatchmakerBootstrapper}"
    WatchmakerConfig       = "${var.WatchmakerConfig}"
    WatchmakerEnvironment  = "${var.WatchmakerEnvironment}"
    WatchmakerOuPath       = "${var.WatchmakerOuPath}"
    WatchmakerAdminGroups  = "${var.WatchmakerAdminGroups}"
    CfnEndpointUrl         = "${var.CfnEndpointUrl}"
    ToggleCfnInitUpdate    = "${var.ToggleCfnInitUpdate}"
    ToggleNewInstances     = "${var.ToggleNewInstances}"
  }
}
