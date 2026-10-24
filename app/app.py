from typing import Annotated

from fastapi import FastAPI, Query

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/items/{item_id}")
def read_item(
    item_id: int,
    query: Annotated[str | None, Query(alias="q")] = None,
):
    return {"item_id": item_id, "q": query}
