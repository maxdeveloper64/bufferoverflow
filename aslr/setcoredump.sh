#!/bin/bash

bash -c "echo 'core.%p.%e.%t.%h' > /proc/sys/kernel/core_pattern"
