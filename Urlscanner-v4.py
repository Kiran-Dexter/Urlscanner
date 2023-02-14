import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin

def get_links(url, session):
    """Extracts all URLs contained within a given webpage"""
    links = set()
    try:
        response = session.get(url)
        if response.status_code == 200:
            soup = BeautifulSoup(response.text, 'html.parser')
            for link in soup.find_all('a'):
                href = link.get('href')
                if href:
                    absolute_url = urljoin(url, href)
                    links.add(absolute_url)
    except requests.exceptions.RequestException:
        pass
    return links

def get_headers(url, session):
    """Returns the HTTP headers for a given URL"""
    try:
        response = session.head(url)
        return response.headers
    except requests.exceptions.RequestException:
        return {}

def crawl_site(url, session):
    """Recursively crawls an entire website and returns all the URLs it contains"""
    urls = set()
    visited = set()
    queue = [url]
    while queue:
        url = queue.pop(0)
        if url in visited:
            continue
        visited.add(url)
        links = get_links(url, session)
        for link in links:
            if link not in visited and link.startswith(url):
                queue.append(link)
        urls.update(links)
    return urls

if __name__ == '__main__':
    url = input("Enter the website URL to scan: ")
    with requests.Session() as session:
        response = session.get(url)
        if 'login' in response.url.lower():
            print("This website requires login.")
            username = input("Enter your username: ")
            password = input("Enter your password: ")
            session.post(response.url, data={'username': username, 'password': password})
        urls = crawl_site(url, session)
        print(f"Found {len(urls)} URLs in {url}:")
        for url in urls:
            headers = get_headers(url, session)
            print(f"{url} ({len(headers)} headers):")
            for name, value in headers.items():
                print(f"  {name}: {value}")
