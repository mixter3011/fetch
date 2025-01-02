from fastapi import FastAPI

from model.chat_body import ChatBody
from services.search import SearchService

app = FastAPI()

search = SearchService()

@app.post("/chat")
def chat_endpoint(body: ChatBody):
    results = search.web_search(body.query);
    print(results) 