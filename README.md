# BrokeredLauncher
A broker based program launcher.

## Purpose
This utility is meant for those who have lots of task which can be batch processed or sequentially executed. Broker Program acts as an intermediatry which launches job submitted to it. For example, I typically have lots of jobs which are launched over LSF farm, and since I have been allocated resources sufficient enough to run one job at a time. I submit all my jobs to broker. After that a launcher program which monitors my current task and gets new task from broker on completion of active tasks.

## Design

There are three components in this design.
- Client
- Broker
- Worker

### Client
Client program is the User gateway. It provides interface for submitting new task, monitor current deployments and moderate broker and worker behavoir. It is implemented in `golang`, `bash` and `python`

### Broker
It is an HTTP based server which acts as intermediatry for holding waiting tasks and completion information provided by Worker on tasks completion. It is implemented in `golang` and `python`

### Worker
Worker Program is used to launch programs which are present in Broker. On task completion it will send completion status to Broker

## Interface
Attempt is made to have identical interface independednt of programming language used.

### Client
`[no option]` or `--help` shows help
`--status` gets the current state of the Broker
`--submit` submit the following string as task along with current working directory to normal queue
`--urgent` submit the following string as task along with current working directory to urgent queue
`--increase-concurrency` increases active task limit of Broker by 1
`--decrease-concurrency` decreases active task limit of Broker by 1
`--enable-urgent-concurrent` allows Broker to release from urgent queue allowing Worker to launch task irrespective of concurrent task limits 
`--purge` clear all lists and queues at Broker, except for active tasks
`--purge-completed` clear completion status of completed tasks at Broker
`--purge-pending` clear pending queue (normal and urgent) at Broker
`--exit-worker` Broker will send exit command to Worker
`--exit` Broker will exit
`--list-pending` Broker sends list of pending tasks
`--list-running` Broker sends list of running tasks
`--list-completed` Broker sends list of completed tasks

### Broker API


### Worker
