package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	//"github.com/stretchr/testify/assert"
)




func TestSingleInstanceSingleRegion(t *testing.T) {
	// variables
	locations := []string{"eu-west-1"}
	
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/",

		Vars: map[string]interface{}{

	
			"instance_count": 1,
	
			"resource_location": locations,
	
		},


	})



	//defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndPlan(t, terraformOptions)
  


}


func TestPlanSingleInstanceSingleRegionwithSingleDisk(t *testing.T) {
	// variables
	locations := []string{"eu-west-1"}
	
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/",

		Vars: map[string]interface{}{

	
			"instance_count": 1,
	
			"resource_location": locations,

			"ebs_count": 1,


	
		},


	})


	terraform.InitAndPlan(t, terraformOptions)

	// defer terraform.Destroy(t, terraformOptions)

}


func TestPlanSingleInstanceSingleRegionwithMultipleDisk(t *testing.T) {
	// variables
	locations := []string{"eu-west-1"}
	
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/",

		Vars: map[string]interface{}{

	
			"instance_count": 1,
	
			"resource_location": locations,

			"ebs_count": 2,


	
		},


	})


	terraform.InitAndPlan(t, terraformOptions)

	// defer terraform.Destroy(t, terraformOptions)

}

func TestPlanMultipleInstanceSingleRegion(t *testing.T) {
	// variables
	locations := []string{"eu-west-1"}
	
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/",

		Vars: map[string]interface{}{

	
			"instance_count": 4,
	
			"resource_location": locations,

			


	
		},


	})


	terraform.InitAndPlan(t, terraformOptions)

	// defer terraform.Destroy(t, terraformOptions)

}

func TestPlanSingleInstanceMultipleRegion(t *testing.T) {
	// variables
	locations := []string{"eu-west-1","eu-west-2"}
	
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/",

		Vars: map[string]interface{}{

	
			"instance_count": 1,
	
			"resource_location": locations,

			


	
		},


	})


	terraform.InitAndPlan(t, terraformOptions)

	// defer terraform.Destroy(t, terraformOptions)

}

func TestPlanMultiplenstanceMultipleRegionwithMultipleDisks(t *testing.T) {
	// variables
	locations := []string{"eu-west-1","eu-west-2"}
	
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/",

		Vars: map[string]interface{}{

	
			"instance_count": 4,
	
			"resource_location": locations,

			"ebs_count": 4,

			


	
		},


	})


	terraform.InitAndPlan(t, terraformOptions)

	// defer terraform.Destroy(t, terraformOptions)

}