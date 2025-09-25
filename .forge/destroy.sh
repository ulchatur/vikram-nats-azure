#!/bin/bash

set -e

echo "Destroying Nats Server app Azure infrastructure..."

terraform -chdir=../infra destroy -auto-approve

echo "Nats Server app infrastructure destroyed successfully."