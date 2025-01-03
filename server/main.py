from fastapi import FastAPI

from model.chat_body import ChatBody
from services.sort import SortSourceService
from services.search import SearchService

app = FastAPI()

search = SearchService()
sort = SortSourceService()

@app.post("/chat")
def chat_endpoint(body: ChatBody):
    results = search.web_search(body.query)
    
    sorted = sort.sort_sources(body.query, results)
    print(sorted)
    
    return body.query