from fastapi import FastAPI

from model.chat_body import ChatBody
from services.llm import LLMService
from services.sort import SortSourceService
from services.search import SearchService

app = FastAPI()

search = SearchService()
sort = SortSourceService()
llm = LLMService()

@app.post("/chat")
def chat_endpoint(body: ChatBody):
    results = search.web_search(body.query)
    
    sorted = sort.sort_sources(body.query, results)

    resp = llm.generate_response(body.query, sorted)
    
    return resp