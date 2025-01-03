from config import Settings
from tavily import TavilyClient
import trafilatura

settings = Settings()
tavily_client = TavilyClient(api_key=settings.TAVILY_API_KEY)

class SearchService:
    def web_search(self, query: str):
        try:
            links = []
            res = tavily_client.search(query, max_results=10)
            results = res.get("results", [])
        
            for result in results:
                received = trafilatura.fetch_url(result.get("url"))
                content = trafilatura.extract(received, include_comments = False)
            
                links.append(
                    {
                        "title": result.get("title", ""),
                        "url": result.get("url", ""),
                        "content": content or "",
                    }
                )
            
            return links
        except Exception as e:
            print(e)