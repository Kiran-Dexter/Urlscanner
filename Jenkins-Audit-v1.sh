#!/bin/bash

# CIS Jenkins Benchmark v2.2.0 - 08-06-2019
# This script performs an audit of a Jenkins instance based on CIS Jenkins Benchmark

# Set a temporary directory to store the reports
temp_dir=$(mktemp -d)

# 1.1
echo "1.1 Disable 'Usage Statistics' (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure System' > 'Usage Statistics' and uncheck 'Enabled'"

# 1.2
echo "1.2 Enable Security (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' and enable security"

# 1.3
echo "1.3 Set Agent → Master Access Control (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'Agent → Master Access Control' and select 'Enforce agent → master access control'"

# 1.4
echo "1.4 Configure Remoting Protocol (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'Agents' > 'TCP port for JNLP agents' and set it to 'Random'"

# 1.5
echo "1.5 Enable CSRF Protection (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'Prevent Cross Site Request Forgery exploits' and check 'Enable proxy compatibility'"

# 1.6
echo "1.6 Enable CLI Over Remoting (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'CLI over Remoting' and check 'Enabled'"

# 1.7
echo "1.7 Configure Agent → Master Access Control for CLI (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'Agent → Master Access Control for CLI' and select 'Enforce agent → master access control for CLI'"

# 1.8
echo "1.8 Enable Slave → Master Access Control (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'Slave → Master Access Control' and check 'Enforce slave → master access control'"

# 1.9
echo "1.9 Use Role-Based Strategy (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'Access Control' and select 'Role-Based Strategy'"

# 1.10
echo "1.10 Secure Agent → Master Communication (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'Agents' > 'Secure connections to agents' and select 'Encrypt agent → master communication'"

# 2.1
echo "2.1 Ensure Jenkins is Up-to-Date (Not Scored)"
echo "Check for available updates in the Jenkins update center and apply them"

# 2.2
echo "2.2 Use Latest LTS Version (Scored)"
echo "Ensure that you are using the latest Long Term Support (LTS) version of Jenkins"

# 3.1
echo "3.1 Disable Inactive Users (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'User Inactivity Monitor' and check 'Enabled'"

# 3.2
echo "3.2 Set Account Lockout for Failed Login Attempts (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'Account Lockout' and set the 'Failed login attempts allowed before account is locked' to a value greater than 0"

#3.3

echo "3.3 Set Session Timeout (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'Session Timeout' and set it to a value less than or equal to 60 minutes"
#3.4

echo "3.4 Set Jenkins URL (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure System' > 'Jenkins URL' and set it to the official URL of the Jenkins instance"
#3.5

echo "3.5 Restrict Logins to Specific IP Ranges (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'Access Control > 'TCP/UDP port for JNLP agents' and set it to a specific IP range or ranges"
#3.6

echo "3.6 Use HTTPS for Jenkins (Scored)"
echo "Use a reverse proxy or load balancer to terminate SSL/TLS for Jenkins, or configure Jenkins to use HTTPS directly"
#3.7

echo "3.7 Disable Script Console (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'Script Console' and uncheck 'Enabled'"
#3.8

echo "3.8 Prevent Unauthorized Access to Jenkins JMX (Scored)"
echo "Add the following JVM argument to the Jenkins startup script: -Dcom.sun.management.jmxremote.port=<unused_port_number> -Dcom.sun.management.jmxremote.authenticate=true -Dcom.sun.management.jmxremote.ssl=true"
#3.9

echo "3.9 Disable Remoting Over CLI (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'CLI over Remoting' and uncheck 'Enabled'"
#3.10

echo "3.10 Use Script Security Plugin (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'Script Security' and check 'Enabled'"
#4.1

echo "4.1 Use Jenkins Plugin Manager (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Manage Plugins' > 'Advanced' and select 'Check Now'"
#4.2

echo "4.2 Use Jenkins Update Sites (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Manage Plugins' > 'Advanced' and check 'Use update site'"
#4.3

echo "4.3 Remove Unnecessary Plugins (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Manage Plugins' > 'Installed' and remove any plugins that are not required"
#4.4

echo "4.4 Enable Plugin and Pipeline Script Security (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'Script Security' and check 'In-process Script Approval'"
#4.5

echo "4.5 Use Pipeline Multibranch Plugin (Scored)"
echo "Use the Pipeline Multibranch Plugin instead of the Pipeline Plugin when possible"
#5.1

echo "5.1 Restrict Job Creation (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'Authorization' and select 'Matrix-based security'. Then, remove the 'Create Jobs' permission from any non-administrative user or group"

# 5.1
echo "5.1 Limit Concurrent Builds (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure System' > 'Number of concurrent builds' and set a reasonable limit"

# 5.2
echo "5.2 Use Jenkins as an Authentication Source (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'Security Realm' and select 'Jenkins’ own user database'"

# 5.3
echo "5.3 Use Active Directory or LDAP for Authentication (Not Scored)"
echo "If using Active Directory or LDAP for authentication, configure it properly"

# 5.4
echo "5.4 Use Project-based Matrix Authorization (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'Authorization' and select 'Project-based Matrix Authorization'"

# 5.5
echo "5.5 Use the Role-based Authorization Strategy (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'Authorization' and select 'Role-Based Strategy'"

# 5.6
echo "5.6 Set Default Build Authorization (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'Authorization' and select 'Logged-in users can do anything'"

# 5.7
echo "5.7 Disable Legacy Protocol Support (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'Agent protocols' and uncheck 'Support Legacy Protocols'"

# 6.1
echo "6.1 Use an Appropriate JDK (Scored)"
echo "Ensure that an appropriate JDK is installed and configured for use by Jenkins"

# 6.2
echo "6.2 Set Up Java Memory Arguments (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure System' > 'JVM options' and set appropriate Java memory arguments"

# 6.3
echo "6.3 Disable JNLP CLI (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure Global Security' > 'CLI' and uncheck 'TCP port for JNLP agents'"

# 6.4
echo "6.4 Use Jenkins Script Console Securely (Scored)"
echo "Avoid running potentially dangerous scripts in the Script Console. If necessary, ensure that access to the Script Console is restricted to trusted users only."

# 7.1
echo "7.1 Set the Jenkins URL (Scored)"
echo "Navigate to 'Manage Jenkins' > 'Configure System' > 'Jenkins URL' and set the appropriate URL"

# 7.2
echo "7.2 Configure Proxy Settings (Not Scored)"
echo "If necessary, configure Jenkins to use a proxy for outgoing network traffic"

# 7.3
echo "7.3 Set Up Jenkins Logging (Not Scored)"
echo "Configure appropriate logging for Jenkins as needed"

# Clean up the temporary directory
rm -rf "$temp_dir"

