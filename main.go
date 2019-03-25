package main

import (
	"github.com/hashicorp/terraform/plugin"
	"github.com/chris-tn/terraform-provider-vultr/vultr"
)

func main() {
	plugin.Serve(&plugin.ServeOpts{
		ProviderFunc: vultr.Provider,
	})
}
