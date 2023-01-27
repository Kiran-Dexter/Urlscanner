import csv
import requests
import ssl
import datetime

# Function to check if a website is alive
def website_alive(url):
    try:
        r = requests.get(url)
        if r.status_code == 200:
            return True
        else:
            return False
    except:
        return False

# Function to check if a website has a file upload path
def check_upload_path(url):
    try:
        r = requests.get(url + '/upload')
        if r.status_code == 200:
            return True
        else:
            return False
    except:
        return False

# Function to check the TLS version of a website
def check_tls_version(url):
    try:
        context = ssl.create_default_context()
        s = context.wrap_socket(socket.socket(), server_hostname=url)
        s.connect((url, 443))
        tls_version = ssl.get_protocol_name(s.version())
        s.close()
        return tls_version
    except:
        return None

# Function to check if a website is blacklisted
def check_blacklist(url):
    try:
        r = requests.get('https://www.blacklistcheck.com/check.php?ip=' + url)
        if 'blacklisted' in r.text:
            return True
        else:
            return False
    except:
        return None

# Function to check if a url is an API
def check_api(url):
    if 'api' in url:
        return True
    else:
        return False

# Open the CSV file
with open('input.csv', 'r') as file:
    reader = csv.reader(file)
    # Skip the header row
    next(reader)
    # Open the output file
    with open('output.csv', 'w') as out:
        writer = csv.writer(out)
        # Write the header row
        writer.writerow(['URL', 'Alive', 'Upload Path', 'TLS Version', 'Secure', 'API', 'Blacklisted', 'Time'])
        for row in reader:
            url = row[0]
            alive = website_alive(url)
            upload_path = check_upload_path(url)
            tls_version = check_tls_version(url)
            secure = False
            if tls_version == 'TLSv1.2':
                secure = True
            api = check_api(url)
            blacklisted = check_blacklist(url)
            time = datetime.datetime.now()
            # Write the row to the output file
            writer.writerow([url, alive, upload_path, tls_version, secure, api, blacklisted, time])

