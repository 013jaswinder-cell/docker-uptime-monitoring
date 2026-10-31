# Docker Container with Uptime Alerts

A Linux-based monitoring project that tracks Docker container availability and CPU usage on an Ubuntu virtual machine and sends automated email notifications using Gmail SMTP.

## Project Overview

This project demonstrates basic infrastructure monitoring and automation using Docker, Bash scripting, Cron jobs, and email notifications.

It monitors an Nginx Docker container and checks CPU usage at regular intervals. When the container goes down or recovers, an automatic email notification is sent.

## Technologies Used

- Ubuntu Linux
- Docker
- Nginx
- Bash Scripting
- Cron Jobs
- msmtp
- Gmail SMTP

## Key Features

- Deploys an Nginx web server inside a Docker container.
- Monitors container availability every minute.
- Sends automatic email alerts when the container goes down.
- Sends recovery notifications when the container comes back online.
- Monitors CPU usage every minute.
- Records CPU readings and detects usage above an 80% threshold.
- Automates monitoring using Linux Cron jobs.

## Monitoring Architecture

Ubuntu VM → Docker Container (Nginx) → Bash Monitoring Scripts → Cron Scheduler → Gmail Notifications

## Project Structure

```text
uptime-alerts-project/
├── monitor_container.sh
├── monitor_cpu.sh
├── screenshots/
│   ├── container_status.png
│   ├── down_alert.png
│   ├── recovery_alert.png
│   └── cpu_monitoring.png
├── .gitignore
└── README.md
```

## Learning Outcomes

- Linux system administration
- Docker container management
- Bash automation
- Scheduled monitoring using Cron
- SMTP-based email notifications
- Basic infrastructure troubleshooting

## Security

- Gmail App Password stored separately from project scripts.
- SMTP configuration files are excluded from version control.
- No credentials or sensitive information should be committed to this repository.

## Future Improvements

- Verify CPU threshold email notifications.
- Add a monitoring dashboard.
- Improve alert handling and reporting.
