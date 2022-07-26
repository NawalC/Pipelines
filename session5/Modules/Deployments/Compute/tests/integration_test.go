package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	//"github.com/stretchr/testify/assert"
)




func TestApplySingleInstanceSingleRegion(t *testing.T) {
	// variables
	locations := []string{"eu-west-1"}
	
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/single_region",

		Vars: map[string]interface{}{

	
			"instance_count": 1,
	
			"resource_location": locations,
	
		},


	})


	defer terraform.Destroy(t, terraformOptions)  

	terraform.InitAndApply(t, terraformOptions)

	
}