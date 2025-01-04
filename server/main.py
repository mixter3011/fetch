import asyncio
from fastapi import FastAPI, WebSocket

from model.chat_body import ChatBody
from services.llm import LLMService
from services.sort import SortSourceService
from services.search import SearchService

app = FastAPI()

search = SearchService()
sort = SortSourceService()
llm = LLMService()

@app.websocket("/ws/chat")
async def websocket_chat_endpoint(websocket: WebSocket):
    await websocket.accept()
    
    try:
        await asyncio.sleep(0.1)
        data = await websocket.receive_json()
        query = data.get("query")
        results = search.web_search(query)
        sorted = sort.sort_sources(query, results)
        await asyncio.sleep(0.1)
        await websocket.send_json({"type": "search", "data": sorted})
        for chunk in llm.generate_response(query, sorted):
            await asyncio.sleep(0.1)
            await websocket.send_json({"type": "content", "data":chunk})
            
    except:
        print("Error")
    finally:
        await websocket.close()

@app.post("/chat")
def chat_endpoint(body: ChatBody):
    results = search.web_search(body.query)
    
    sorted = sort.sort_sources(body.query, results)

    resp = llm.generate_response(body.query, sorted)
    
    return resp