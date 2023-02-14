import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin

def get_links(url):
    """Extracts all URLs contained within a given webpage"""
    links = set()
    try:
        response = requests.get(url)
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

def crawl_site(url):
    """Recursively crawls an entire website and returns all the URLs it contains"""
    urls = set()
    visited = set()
    queue = [url]
    while queue:
        url = queue.pop(0)
        if url in visited:
            continue
        visited.add(url)
        links = get_links(url)
        for link in links:
            if link not in visited and link.startswith(url):
                queue.append(link)
        urls.update(links)
    return urls

if __name__ == '__main__':
    url = input("Enter the website URL to scan: ")
    urls = crawl_site(url)
    print(f"Found {len(urls)} URLs in {url}:")
    for url in urls:
        print(url)
